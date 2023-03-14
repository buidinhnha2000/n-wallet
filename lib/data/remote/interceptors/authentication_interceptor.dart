import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../app_flavor.dart';
import '../../../models/models.dart';
import '../../local/local.dart';
import '../apis/api_path.dart';
import '../apis/auth/authentication_api.dart';
import '../status_code.dart';

class AuthenticationInterceptor extends Interceptor {
  final LocalStorage localStorage;
  final AuthenticationApi authenticationApi;

  AuthenticationInterceptor(
      {required this.localStorage, required this.authenticationApi});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final userJson = localStorage.getString(LocalStorageKey.user);
    if (userJson == null) return;
    final user = User.fromJson(jsonDecode(userJson));
    options.headers['Authorization'] = 'Bearer ${user.accessToken}';
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    final userJson = localStorage.getString(LocalStorageKey.user);
    if (userJson == null) return;
    final user = User.fromJson(jsonDecode(userJson));
    if (err.response?.statusCode == NetworkStatusCode.unauthorized) {
      final options = err.requestOptions;

      options.headers['Authorization'] = 'Bearer ${user.refreshToken}';

      final opts = Options(
        method: err.requestOptions.method,
        headers: err.requestOptions.headers,
      );
      final response = await Dio().request(
          AppFlavor.staging.baseUrl + ApiPath.refreshToken,
          options: opts);
      final token = Token.fromJson(response.data);
      if (token.accessToken?.isNotEmpty == true &&
          token.refreshToken?.isNotEmpty == true) {
        localStorage.setString(
            LocalStorageKey.user,
            jsonEncode(user
                .copyWith(
                    accessToken: token.accessToken,
                    refreshToken: token.refreshToken)
                .toJson()));
      }
      options.headers['Authorization'] = 'Bearer ${user.accessToken}';
      final cloneReq = await Dio().request(err.requestOptions.path,
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters);
      return handler.resolve(cloneReq);
    }
  }
}
