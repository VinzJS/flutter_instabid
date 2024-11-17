import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double maxHeight;
  final Function()? onTap;

  const ProductCard({
    super.key,
    this.onTap,
    required this.product,
    this.maxHeight = 250,
  });

  @override
  Widget build(BuildContext context) {
    ///
    /// is Biddable
    ///
    if (product.isBiddable) {
      final displayImage = product.displayImage ?? '';
      return GestureDetector(
        onTap: () =>
            onTap?.call() ?? PublicProductPageRoute(product.id).push(context),
        child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              /// Image
              ///

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: maxHeight,
                ),
                child: ProductImage(product: product),
              ),

              ///
              /// Details
              ///

              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductPrice(product: product),
                    Text(product.name),
                    ProductCountDown(product: product),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    ///
    /// if normal product
    ///
    return GestureDetector(
      onTap: () =>
          onTap?.call() ?? PublicProductPageRoute(product.id).push(context),
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            /// Image
            ///
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: maxHeight,
              ),
              child: ProductImage(product: product),
            ),

            ///
            /// Details
            ///
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductPrice(product: product),
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
