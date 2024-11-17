import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_update_controller.g.dart';

class OrderUpdateParams {
  final User user;
  final Product product;

  OrderUpdateParams({required this.user, required this.product});
}

@riverpod
class OrderUpdateController extends _$OrderUpdateController {
  @override
  FutureOr<OrderUpdateParams> build(String orderId) async {
    final order = await ref.read(orderControllerProvider(orderId).future);

    final productId = order.productCopy.id;
    final product = await ref.watch(
      productControllerProvider(productId).future,
    );

    return OrderUpdateParams(
      user: ref.watch(authControllerProvider).value!,
      product: product,
    );
  }
}
