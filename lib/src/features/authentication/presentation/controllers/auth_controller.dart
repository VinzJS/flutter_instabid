import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  ///
  ///
  ///
  final _noUserFailure = Failure.presentation('User not found');

  @override
  Future<User> build() async {
    final result = await ref
        .read(authApplicationProvider)
        .getSavedUser()
        .run()
        .timeout(const Duration(minutes: 1));

    return result.fold(
      (l) {
        ref.read(authRepositoryProvider).logout();
        throw l;
      },
      (r) => r,
    );
  }

  TaskResult<User> setUser(User? user) {
    if (user == null) {
      state = AsyncValue.error(_noUserFailure, StackTrace.current);
      return TaskResult.left(Failure.presentation('No User Failure'));
    }

    state = AsyncData(user);
    return TaskResult<User>.right(user);
  }

  TaskResult<User> refresh() {
    return ref.read(authApplicationProvider).getSavedUser().chainFirst(setUser);
  }

  TaskResult<User> login({
    required String email,
    required String password,
  }) {
    if (email.isEmpty || password.isEmpty) {
      return TaskResult.left(Failure.presentation('invalid fields'));
    }
    final repo = ref.read(authRepositoryProvider);

    return repo.login(email: email, password: password).chainFirst(setUser);
  }

  TaskResult<User> register({
    required String email,
    required String name,
    required String password,
    required String passwordConfirm,
  }) {
    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        passwordConfirm.isEmpty) {
      return TaskResult.left(Failure.presentation('invalid fields'));
    }

    if (password != passwordConfirm) {
      return TaskResult.left(Failure.presentation('passwords do not match'));
    }

    final repo = ref.read(authRepositoryProvider);

    return repo
        .register(
          email: email,
          name: name,
          password: password,
          passwordConfirm: passwordConfirm,
        )
        .chainFirst(setUser);
  }

  TaskResult<void> logout() {
    return ref
        .read(authRepositoryProvider)
        .logout()
        .chainFirst((_) => setUser(null));
  }
}
