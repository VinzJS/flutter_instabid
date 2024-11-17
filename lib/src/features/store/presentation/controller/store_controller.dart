import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store_controller.g.dart';

@riverpod
class StoreController extends _$StoreController {
  @override
  FutureOr<StoreFront> build(String id) async {
    final repo = ref.read(storeRepositoryProvider);

    final result = await repo.get(id).run();

    return result.fold(Future.error, Future.value);
  }
}
