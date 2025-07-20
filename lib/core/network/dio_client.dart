import 'package:dio/dio.dart';

import 'dio_interceptors.dart';

class DioClient {
  static const String baseUrl = '';
  late Dio _dio;

  DioClient(){
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _dio.interceptors.add(DioInterceptors());
  }
  Dio get instance => _dio;
}