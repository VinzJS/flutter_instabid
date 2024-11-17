import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_controller.g.dart';

@riverpod
class TagController extends _$TagController {
  @override
  FutureOr<Tag> build(String id) async {
    final repo = ref.read(tagRepositoryProvider);
    final result = await repo.get(id).run();
    return result.fold(Future.error, (x) => Future.value(x));
  }
}
