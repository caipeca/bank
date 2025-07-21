import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_result.dart';
import '../domain/model/user_model.dart';
import '../domain/repository/auth_repository.dart';
import 'auth_provider.dart';

final authControllerProvider =
StateNotifierProvider<AuthController, AsyncValue<User>>((ref) {
  final repository = ref.read(authRepositoryProvider);
  return AuthController(repository);
});

class AuthController extends StateNotifier<AsyncValue<User>> {
  final AuthRepository _repository;

  AuthController(this._repository) : super(AsyncValue.data(User(id: 0, name: '', email: '')));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();

    final result = await _repository.login(email, password);

    if (result is ApiSuccess<User>) {
      state = AsyncValue.data(result.data);
    } else if (result is ApiFailure) {
      final failure = result as ApiFailure;
      state = AsyncValue.error(Exception(failure.message), StackTrace.current);
    }

  }
/*
  Future<void> logout() async {
    await _repository.logout(); // Se tiver
    state = const AsyncValue.data(null);
  }

 */
}
