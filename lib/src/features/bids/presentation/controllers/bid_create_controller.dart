import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bid_create_controller.g.dart';

class BidCreateState {
  final User user;
  final Product product;
  final Bid? bid;

  BidCreateState({required this.user, required this.product, this.bid});
}

@riverpod
class BidCreateController extends _$BidCreateController {
  @override
  FutureOr<BidCreateState> build(String productId) async {
    /// this is used to get the user from the active riverpod controllers in future form
    final user = await ref.read(authControllerProvider.future);

    /// same with user this will trigger the product controll provider to get the data if not yet loaded
    final product = await ref.read(productControllerProvider(productId).future);

    /// Bid
    final bidRepo = ref.read(bidRepositoryProvider);
    final result = await bidRepo
        .list(query: 'product = "${product.id}" && user = "${user.id}" ')
        .run();

    final bid = result.fold((l) => null, (r) => r.items.firstOrNull);

    return BidCreateState(
      product: product,
      user: user,
      bid: bid,
    );
  }
}
