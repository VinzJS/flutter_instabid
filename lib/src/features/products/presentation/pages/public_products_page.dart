import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicProductsPage extends HookConsumerWidget {
  const PublicProductsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = productsControllerProvider;
    final state = ref.watch(provider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ///
          /// AppBar
          ///
          SliverAppBar(
            pinned: true,
            title: Text(
              'InstaBid',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  const PublicProductSearchPageRoute().push(context);
                },
                icon: Icon(MIcons.magnify),
              ),
              IconButton(
                onPressed: () {
                  ref.invalidate(provider);
                  ref.invalidate(tagsControllerProvider);
                },
                icon: Icon(MIcons.refresh),
              ),
            ],
          ),

          ///
          ///  list of categories
          ///
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 12),
                  // child: Text('Categories'),
                ),
                TagVerticalList(),
              ],
            ),
          ),

          ///
          /// spacer
          ///
          const SliverToBoxAdapter(child: SizedBox(height: 30)),

          ///
          /// Random Products
          ///
          state.when(
            skipError: false,
            skipLoadingOnRefresh: false,
            skipLoadingOnReload: false,
            data: (products) {
              ///
              /// List of products
              ///
              return ProductGrid.sliver(products);
            },
            error: (error, stackTrace) {
              return SliverFillRemaining(
                child: Center(
                  child: Text(error.toString()),
                ),
              );
            },
            loading: () => const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
