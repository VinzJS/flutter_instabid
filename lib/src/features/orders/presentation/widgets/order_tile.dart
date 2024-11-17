import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => PublicOrderPageRoute(order.id).push(context),
      leading: ProductImage(product: order.productCopy),
      title: Text(order.id),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
