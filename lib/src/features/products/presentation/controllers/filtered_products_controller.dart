import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_products_controller.g.dart';


@riverpod
class FilteredProductsController extends _$FilteredProductsController {
  @override
  FutureOr<List<Product>> build(String query) async {
    
    final repo = ref.read(productRepositoryProvider);
    final result = await repo
        .list(query: query, pageSize: 500, pageNo: 1)
        .run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}
