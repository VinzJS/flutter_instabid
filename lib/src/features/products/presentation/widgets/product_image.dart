import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  final double width;

  const ProductImage(
      {super.key, required this.product, this.width = double.maxFinite});
  static Widget circle(Product product, {required double width}) =>
      CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ProductImage(product: product, width: width),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final value = product.displayImage;
      if (value is String && value.isNotEmpty) {
        return ImageViewer(
          builder: (url) => CachedNetworkImage(
            width: width,
            imageUrl: url,
            fit: BoxFit.fill,
            placeholder: (context, url) => SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
          ),
          feature: 'products',
          file: value,
          id: product.id,
        );
      }

      return ImageMissingView();
    });
  }
}
