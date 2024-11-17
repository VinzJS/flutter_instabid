import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class CategoryList extends HookConsumerWidget {
  final String filter;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const CategoryList({
    super.key,
    required this.filter,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = filteredCategoriesControllerProvider(filter);
    final state = ref.watch(provider);

    return state.when(
      skipError: false,
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      data: (result) {
        final categories = result;
        return ListView.builder(
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryTile(category: category);
          },
        );
      },
      error: (error, stackTrace) {
        return const Center(child: Text('Something went wrong'));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
