import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_view_controller.g.dart';

class ProductViewState {
  final Bid? bid;
  final Product product;
  final User user;

  ProductViewState({
    this.bid,
    required this.product,
    required this.user,
  });
}

@riverpod
class ProductViewController extends _$ProductViewController {
  @override
  FutureOr<ProductViewState> build(String id) async {
    final user = await ref.read(authControllerProvider.future);
    final product = await ref.read(productControllerProvider(id).future);
    final filter = 'product = "${product.id}" && user = "${user.id}"';
    final bid = await ref.read(filteredBidsControllerProvider(filter).future);

    return ProductViewState(
      product: product,
      user: user,
      bid: bid.firstOrNull,
    );
  }
}
