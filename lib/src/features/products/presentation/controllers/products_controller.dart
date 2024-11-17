import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_controller.g.dart';

@riverpod
class ProductsController extends _$ProductsController {
  @override
  FutureOr<List<Product>> build() async {
    final repo = ref.read(productRepositoryProvider);
    final result = await repo.list(pageSize: 500, pageNo: 1).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}
