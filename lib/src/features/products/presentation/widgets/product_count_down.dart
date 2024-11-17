import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class ProductCountDown extends StatelessWidget {
  final Product product;

  const ProductCountDown({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return ElapsedTimeView(
      startTime: product.bidStartDate ?? DateTime.now(),
      endTime: product.bidEndDate ?? DateTime.now(),
      currentTime: DateTime.now(),
      style: Theme.of(context).textTheme.labelSmall,
    );
  }
}
