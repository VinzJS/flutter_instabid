import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bid_view_controller.g.dart';

class BidViewState {
  final Bid bid;
  final Product product;

  BidViewState({required this.bid, required this.product});
}

@riverpod
class BidViewController extends _$BidViewController {
  @override
  FutureOr<BidViewState> build(String id) async {
    final bid = await ref.read(bidControllerProvider(id).future);

    final product =
        await ref.read(productControllerProvider(bid.product).future);

    return BidViewState(bid: bid, product: product);
  }
}
