import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class OrderBanner extends StatelessWidget {
  final Order order;

  const OrderBanner({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    Widget buildWidget(BuildContext context, Order order) {
      if (order.orderStatus == OrderStatus.pending) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.orderStatus.name.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20),
            Text('Your order has been placed!'),
            Text('Wait for the store to contact you about you delivery.'),
          ],
        );
      }

      if (order.orderStatus == OrderStatus.unkown) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.orderStatus.name.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20),
            Text('Something went wrong!'),
            Text('Please try again later.'),
          ],
        );
      }

      if (order.orderStatus == OrderStatus.cancelled) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.orderStatus.name.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20),
            Text('Your order has been cancelled!'),
            Text('Thank you for using InstaBid!'),
          ],
        );
      }

      if (order.orderStatus == OrderStatus.completed) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.orderStatus.name.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20),
            Text('Your order has been completed!'),
            Text('Thank you for using InstaBid!'),
          ],
        );
      }
      return SizedBox();
    }

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: buildWidget(context, order),
      ),
    );
  }
}
