import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => StoreCategoryProductsPageRoute(category.id).push(context),
      title: Text(category.name),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
