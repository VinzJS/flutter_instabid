import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_products_controller.g.dart';

class TagProductResult {
  final Tag tag;
  final List<Product> products;

  TagProductResult({required this.tag, required this.products});
}

@riverpod
class TagProductsController extends _$TagProductsController {
  @override
  FutureOr<TagProductResult> build(String tagId) async {
    final tag = await ref.read(tagControllerProvider(tagId).future);
    final repo = ref.read(productRepositoryProvider);
    final result = await repo
        .list(query: 'tags ~ "$tagId"', pageSize: 999, pageNo: 1)
        .run();
    return result.fold(Future.error, (x) => Future.value(
      TagProductResult(tag: tag, products: x.items),
    ));
  }
}
