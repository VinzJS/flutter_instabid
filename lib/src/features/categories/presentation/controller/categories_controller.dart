import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_controller.g.dart';


@riverpod
class CategoriesController extends _$CategoriesController {
  @override
  Future<List<Category>> build() async {
    final repo = ref.read(categoryRepositoryProvider);
    final result = await repo.list(pageSize: 500, pageNo: 1).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}
