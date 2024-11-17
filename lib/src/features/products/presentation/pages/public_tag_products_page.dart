import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicTagProductsPage extends HookConsumerWidget {
  final String tagId;

  const PublicTagProductsPage({super.key, required this.tagId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = tagProductsControllerProvider(tagId);
    final state = ref.watch(provider);

    return Scaffold(
      body: state.when(
        skipError: false,
        skipLoadingOnRefresh: false,
        skipLoadingOnReload: false,
        data: (result) {
          final products = result.products;
          final tag = result.tag;

          if (products.isEmpty) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(tag.name),
                  pinned: true,
                ),
                const SliverFillRemaining(
                  child: Center(
                    child: Text('No products found'),
                  ),
                ),
              ],
            );
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(tag.name),
                pinned: true,
              ),
              SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.63,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      maxHeight: 150,
                    );
                  }),
            ],
          );
        },
        error: (error, stackTrace) {
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Something went wrong'),
                pinned: true,
              ),
              SliverFillRemaining(
                child: Center(
                  child: Text(error.toString()),
                ),
              ),
            ],
          );
        },
        loading: () => const CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Loading...'),
              pinned: true,
            ),
            SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
