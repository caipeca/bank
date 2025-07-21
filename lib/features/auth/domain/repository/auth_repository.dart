import 'package:bank/core/network/api_result.dart';
import 'package:bank/features/auth/domain/model/user_model.dart';

abstract class AuthRepository{
  Future<ApiResult<User>> login(String email, String password);
}