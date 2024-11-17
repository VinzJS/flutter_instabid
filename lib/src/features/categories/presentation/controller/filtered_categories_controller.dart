import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_categories_controller.g.dart';

@riverpod
class FilteredCategoriesController extends _$FilteredCategoriesController {
  @override
  Future<List<Category>> build(String filter) async {
    final repo = ref.read(categoryRepositoryProvider);
    final result =
        await repo.list(pageSize: 500, pageNo: 1, query: filter).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}
