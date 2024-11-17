import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreCategoryProductsPage extends HookConsumerWidget {
  final String id;

  const StoreCategoryProductsPage({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryControllerProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: state.when(
            data: (category) => Text(category.name),
            error: (error, stack) => const Text('Something went wrong...'),
            loading: () => const Text('Loading...')),
      ),
      body: ProductList(filter: 'category = "$id" '),
    );
  }
}
