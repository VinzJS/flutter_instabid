import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instabid/_index.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final double size;
  final Widget? trailing;

  final Function()? onTap;

  const ProductTile(
      {super.key,
      required this.product,
      this.trailing,
      this.onTap,
      this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    ///
    /// function to build the images
    ///
    Widget? buildImage(String? image) {
      if (image is String) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size,
            maxHeight: size,
          ),
          child: Builder(
            builder: (context) {
              if (image.isEmpty) return ImageMissingView();
              return ImageViewer(
                builder: (url) {
                  return CachedNetworkImage(
                    height: size,
                    width: size,
                    imageUrl: url,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                },
                feature: 'products',
                file: image,
                id: product.id,
              );
            },
          ),
        );
      }
      return null;
    }

    return ListTile(
      onTap: () => onTap?.call(),
      isThreeLine: true,
      leading: buildImage(product.displayImage),
      title: Text(product.name),
      subtitle: Text('${product.price}'),
      trailing: trailing,
    );
  }
}
