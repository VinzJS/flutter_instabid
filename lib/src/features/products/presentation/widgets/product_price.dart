import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class ProductPrice extends StatelessWidget {
  final Product product;

  const ProductPrice({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Text(
      'P ${product.price}',
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
