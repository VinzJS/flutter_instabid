import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:searchfield/searchfield.dart';

class ProductFormField extends HookConsumerWidget {
  final String name;
  final bool enabled;
  final Function(Product?)? onChanged;
  final dynamic Function(Product)? valueTransformer;

  const ProductFormField({
    super.key,
    this.enabled = true,
    required this.name,
    this.onChanged,
    this.valueTransformer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    ///
    ///
    Future<List<Product>> search(String? query) async {
      final result = await ref
          .read(productRepositoryProvider)
          .list(query: 'name ~ "$query"', pageNo: 1, pageSize: 10)
          .run();
      return result.fold(Future.error, (r) => Future.value(r.items));
    }

    return CustomFormField<Product>(
      name: name,
      enabled: enabled,
      onChanged: onChanged,
      onSearch: search,
      hint: 'Product',
      valueTransformer: (p0) {
        final value = p0;
        if (value is Product) return valueTransformer?.call(value);
      },
      selectedBuilder: (p0, controller) => ProductTile(
          product: p0,
          trailing: enabled
              ? IconButton(
                  onPressed: () {
                    FormBuilder.of(context)?.fields[name]?.didChange(null);
                    controller.clear();
                  },
                  icon: const Icon(Icons.close),
                )
              : null),
      onChild: (p0) => SearchFieldListItem<Product>(
        p0.id,
        item: p0,
        child: Text(p0.id),
      ),
    );
  }
}
