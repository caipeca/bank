import 'package:dio/dio.dart';

class DioInterceptors extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _getToken();

    if(token != null && token.isNotEmpty){
      options.headers['Authorization'] = 'Bearer $token';
    }

    print('[REQUEST]${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    print('Body: ${options.data}');

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('[RESPONSE] ${response.statusCode} => ${response.requestOptions.uri}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('[ERROR] ${err.response?.statusCode} => ${err.requestOptions.uri}');
    print('Message: ${err.message}');

    if(err.response?.statusCode == 401){
      print('Token expirado. Faça login novamente');
    }

    return handler.next(err);
  }


  Future<String?> _getToken() async {
    return null;
  }
}