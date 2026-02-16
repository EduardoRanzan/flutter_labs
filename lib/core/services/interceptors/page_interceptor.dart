import 'package:dio/dio.dart';

class PageInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler){
    options.headers['Prefer'] = 'count=exact';
    handler.next(options);
  }
}