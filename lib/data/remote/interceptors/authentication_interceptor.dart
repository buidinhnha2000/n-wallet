import 'package:dio/dio.dart';

import '../../local/local.dart';
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
      await authenticationApi.refreshToken();
      final options = err.requestOptions;
      final accessToken = localStorage.getString(LocalStorageKey.accessToken);
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
      final opts = Options(
        method: err.requestOptions.method,
        headers: err.requestOptions.headers,
      );
      final cloneReq = await Dio().request(err.requestOptions.path,
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters);
      return handler.resolve(cloneReq);
    }
  }
}
