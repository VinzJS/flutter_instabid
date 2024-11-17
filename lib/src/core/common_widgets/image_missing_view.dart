import 'package:flutter/material.dart';
import 'package:instabid/src/core/assets/_index.dart';

///
/// Simple widget for showing a missing image
/// for when an image is missing
///
///
class ImageMissingView extends StatelessWidget {
  const ImageMissingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 120),
      child: Center(
        child: Assets.icons.appIconTransparent.image(),
      ),
    );
  }
}
