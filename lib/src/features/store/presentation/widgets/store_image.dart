import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class StoreImage extends StatelessWidget {
  final StoreFront store;

  const StoreImage({super.key, required this.store});

  static Widget circle(StoreFront store) => CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: StoreImage(store: store),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final value = store.displayImage;
      if (value is String && value.isNotEmpty) {
        return ImageViewer(
          builder: (url) => CachedNetworkImage(
            width: double.maxFinite,
            imageUrl: url,
            fit: BoxFit.cover,
            placeholder: (context, url) => SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
          ),
          feature: 'stores',
          file: value,
          id: store.id,
        );
      }

      return ImageMissingView();
    });
  }
}
