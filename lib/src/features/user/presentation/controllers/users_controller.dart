import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_controller.g.dart';

@riverpod
class UsersController extends _$UsersController {
  @override
  FutureOr<List<User>> build() async {
    final repo = ref.read(userRepositoryProvider);
    final result = await repo.list(
      pageSize: 999,
      pageNo: 1
    ).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}
