import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    storage: ref.read(flutterSecureStorageProvider),
    dio: ref.read(dioProvider),
    idKey: 'AUTH_ID',
    tokenKey: 'AUTH_TOKEN',
  );
}

abstract class AuthRepository {

  TaskResult<String> getToken();
  TaskResult<String> getId();

  TaskResult<void> refresh();

  ///
  /// Login user with email and password
  ///
  TaskResult<User> login({required String email, required String password});

  ///
  /// Logout user
  ///
  TaskResult<void> logout();

  ///
  /// Register user with email, name, password and passwordConfirm
  ///

  TaskResult<User> register({
    required String email,
    required String name,
    required String password,
    required String passwordConfirm,
  });
}
