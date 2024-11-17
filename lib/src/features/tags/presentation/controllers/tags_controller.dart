import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tags_controller.g.dart';

@riverpod
class TagsController extends _$TagsController {
  @override
  FutureOr<List<Tag>> build() async {
    final repo = ref.read(tagRepositoryProvider);
    final result = await repo.list(
      pageSize: 999,
      pageNo: 1
    ).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}
