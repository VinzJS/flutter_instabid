import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicProductPage extends HookConsumerWidget {
  final String id;

  const PublicProductPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productControllerProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const ProductSearchBar(),
      ),
      bottomNavigationBar: state.maybeWhen(
        skipError: false,
        skipLoadingOnRefresh: false,
        skipLoadingOnReload: false,
        orElse: () => const SizedBox(),
        data: (product) {
          return ProductBottomBar(product: product);
        },
      ),
      body: state.when(
        skipError: false,
        skipLoadingOnRefresh: false,
        skipLoadingOnReload: false,
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (product) {
          return CustomScrollView(slivers: [
            ///
            /// Product
            ///
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ProductImage(product: product),
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverList.list(
              children: [
                ///
                /// Dates
                ///
                if (product.isBiddable)
                  ListTile(
                    leading: Icon(MIcons.clockOutline),
                    title: ProductCountDown(product: product),
                  ),

                ///
                /// Price and product name
                ///
                ListTile(
                  title: ProductPrice(product: product),
                  subtitle: Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                const SizedBox(height: 20),

                ///
                /// Store
                ///
                StoreTile.optional(product.store),
                const SizedBox(height: 20),
                Divider(
                  thickness: 10,
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
                ListTile(
                  title: Text(
                    'About this product',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),

                ///
                /// Description
                ///
                ListTile(
                  title: Text(product.description ?? '-'),
                ),
              ],
            ),
          ]);
        },
      ),
    );
  }
}
