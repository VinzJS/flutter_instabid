import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final bool useSliver;
  final Function(Product)? onTap;

  const ProductGrid({
    super.key,
    required this.products,
    this.useSliver = false,
    this.onTap,
  });

  static Widget sliver(List<Product> products) {
    return ProductGrid(
      products: products,
      useSliver: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty && useSliver == false) {
      return const Center(
        child: Text('No products found'),
      );
    }

    if (products.isEmpty && useSliver == true) {
      return const SliverFillRemaining(
        child: Center(
          child: Text('No products found'),
        ),
      );
    }

    const delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 18,
      crossAxisSpacing: 20,
      childAspectRatio: 0.65,
    );

    final length = products.length;
    if (useSliver) {
      return SliverGrid.builder(
        gridDelegate: delegate,
        itemCount: length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            maxHeight: 140,
            product: product,
            onTap: () => onTap?.call(product),
          );
        },
      );
    }
    return GridView.builder(
      gridDelegate: delegate,
      itemCount: length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          maxHeight: 140,
          onTap: () => onTap?.call(product),
        );
      },
    );
  }
}
