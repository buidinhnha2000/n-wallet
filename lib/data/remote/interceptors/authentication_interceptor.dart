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
    options.headers['Authorization'] =
        'Bearer ${localStorage.getString(LocalStorageKey.accessToken)}';
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
    if (err.response?.statusCode == NetworkStatusCode.unauthorized) {
      final options = err.requestOptions;

      options.headers['Authorization'] =
          'Bearer ${localStorage.getString(LocalStorageKey.refreshToken)}';

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
        localStorage.setString(LocalStorageKey.accessToken, token.accessToken!);
        localStorage.setString(
            LocalStorageKey.refreshToken, token.refreshToken!);
      }
      options.headers['Authorization'] =
          'Bearer ${localStorage.getString(LocalStorageKey.accessToken)}';
      final cloneReq = await Dio().request(err.requestOptions.path,
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters);
      return handler.resolve(cloneReq);
    }
  }
}
