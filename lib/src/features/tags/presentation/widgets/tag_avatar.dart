import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class TagAvatar extends StatelessWidget {
  final Tag tag;

  const TagAvatar({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    Widget buildIcon(Tag tag) {
      final icon = tag.icon;
      IconData? data;
      if (icon is String && icon.isNotEmpty) {
        data = MIcons.fromString(icon);
      }

      return Icon(data ?? MIcons.cubeOutline, size: 40);
    }

    return GestureDetector(
      onTap: () => PublicTagProductsPageRoute(tag.id).push(context),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              minRadius: 40,
              child: buildIcon(tag),
            ),
            const SizedBox(height: 5),
            Text(tag.name),
          ],
        ),
      ),
    );
  }
}
