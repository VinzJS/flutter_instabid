import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_filtered_controller.g.dart';

@riverpod
class ProductsFilteredController extends _$ProductsFilteredController {
  @override
  FutureOr<List<Product>> build(String query) async {
    final repo = ref.read(productRepositoryProvider);
    final result = await repo.list(
      query: 'name ~ "${query.toLowerCase()}"',
      pageSize: 999,
      pageNo: 1
    ).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}
