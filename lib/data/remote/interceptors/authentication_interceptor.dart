import 'package:dio/dio.dart';

import '../../local/local.dart';

class AuthenticationInterceptor extends Interceptor {
  final LocalStorage localStorage;

  AuthenticationInterceptor(this.localStorage);

  // AuthenticationInterceptor(this.localStorage);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer ${localStorage.getString(LocalStorageKey.accessToken)}';
    handler.next(options);
  }
}
