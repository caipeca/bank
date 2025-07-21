import 'package:bank/features/auth/data/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/network/dio_client.dart';
import '../domain/repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = DioClient().instance;
  final secureStorage = FlutterSecureStorage();
  return AuthRepositoryImpl(dio: dio, secureStorage: secureStorage);
});
