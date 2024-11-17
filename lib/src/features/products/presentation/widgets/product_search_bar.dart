import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      hoverColor: Colors.transparent,
      tileColor: Theme.of(context).splashColor,
      contentPadding: const EdgeInsets.only(left: 12),
      dense: true,
      leading: Icon(MIcons.magnify),
      title: const Text('Search'),
      onTap: () => const PublicProductSearchPageRoute().push(context),
    );
  }
}
