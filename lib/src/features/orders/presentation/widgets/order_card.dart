import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => PublicOrderPageRoute(order.id).push(context),
        title: Text(order.productCopy.name),
        subtitle: Text(order.orderStatus.name),
      ),
    );
  }
}
