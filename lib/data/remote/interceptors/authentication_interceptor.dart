import 'package:dio/dio.dart';

import '../../../di/service_locator.dart';
import '../../local/local.dart';

class AuthenticationInterceptor extends Interceptor {
  final LocalStorage localStorage = ServiceLocator.instance.inject();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer ${localStorage.getString(LocalStorageKey.accessToken)}';
    handler.next(options);
  }
}
