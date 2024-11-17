import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicStorePage extends HookConsumerWidget {
  final String id;

  const PublicStorePage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storeControllerProvider(id));
    return state.when(
      error: (error, stack) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(child: Text(error.toString())),
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
      data: (store) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const ProductSearchBar(),
            ),
            body: CustomScrollView(
              slivers: [
                SliverList.list(
                  children: [
                    const SizedBox(height: 10),
                    ListTile(
                      title: Text(
                        store.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    ListTile(
                      title: Text(store.description ?? '-'),
                    ),
                    ListTile(
                      leading: Icon(MIcons.mapOutline),
                      title: Text(store.address ?? '-'),
                    ),
                    ListTile(
                      title: Text(
                        'Rating',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      subtitle: StarRating(rating: store.rating),
                    ),
                  ],
                ),

                ///
                /// List of products
                ///
                const SliverToBoxAdapter(
                  child: TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: 'Products'),
                      Tab(text: 'Categories'),
                    ],
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),

                SliverFillRemaining(
                  child: TabBarView(
                    children: [
                      ProductList(
                        filter: 'store = "$id" ',
                      ),
                      CategoryList(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        filter: 'store = "$id" ',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
