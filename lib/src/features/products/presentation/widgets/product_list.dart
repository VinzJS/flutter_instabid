import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class ProductList extends HookConsumerWidget {
  final String filter;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget Function(List<Product> products)? builder;

  const ProductList({
    super.key,
    required this.filter,
    this.shrinkWrap = false,
    this.physics,
    this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = filteredProductsControllerProvider(filter);
    final state = ref.watch(provider);

    return state.when(
      skipError: false,
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      data: (result) {
        final products = result;
        return builder?.call(products) ?? ProductGrid(products: products);
      },
      error: (error, stackTrace) {
        return const SizedBox();
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
