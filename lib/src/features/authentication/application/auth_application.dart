import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_application.g.dart';

@Riverpod(keepAlive: true)
AuthApplication authApplication(Ref ref) {
  return AuthApplicationImpl(
    userRepository: ref.watch(userRepositoryProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
}

abstract class AuthApplication {
  TaskResult<User> getSavedUser();
}

class AuthApplicationImpl extends AuthApplication {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  AuthApplicationImpl(
      {required this.userRepository, required this.authRepository});

  @override
  TaskResult<User> getSavedUser() {
    return TaskResult.Do(($) async {
      final id = await $(authRepository.getId());
      return await $(userRepository.get(id));
    });
  }
}
