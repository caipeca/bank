import 'package:bank/core/network/api_result.dart';
import 'package:bank/core/network/dio_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bank/features/auth/domain/model/user_model.dart';
import 'package:bank/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl({required this.dio, required this.secureStorage});

  @override
  Future<ApiResult<User>> login(String email, String password) async {
    try{
      final response = await dio.post('path', data: {
        'email': email,
        'password': password,
      });
      final user = User.fromJson(response.data['user']);
      final token = response.data['token'];

      // Aqui você pode armazenar o token com flutter_secure_storage

      await secureStorage.write(key: 'accessToken', value: token);
      
      return ApiSuccess(user);
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Erro inesperado';
      final status = e.response?.statusCode;

      return ApiFailure(message: message, statusCode: status);
    }catch (_){
      return ApiFailure(message: 'Erro inesperado');
    }
  }

}