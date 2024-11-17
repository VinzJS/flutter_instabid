import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreProductSelectPage extends HookConsumerWidget {
  // store id
  final String id;

  const StoreProductSelectPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    final textCtrl = useTextEditingController();
    final searchQuery = useState('');
    final showSearch = useState(false);

    ///
    ///  Build the search query first
    ///
    final defaultQuery = 'store = "$id"';
    final searchValue = searchQuery.value;
    final filter = Result.tryCatch(
      () {
        if (searchValue.isEmpty) return defaultQuery;
        return 'store = "$id" && name ?~ "$searchValue"';
      },
      Failure.presentation,
    ).getOrElse(
      (x) => defaultQuery,
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(MIcons.plus),
        onPressed: () async {
          final result = await StoreProductCreatePageRoute(id).push(context);
          if (result is Product) {
            ref.invalidate(filteredProductsControllerProvider(filter));
          }
        },
      ),
      appBar: AppBar(
        title: const Text('Select a Product'),
        actions: [
          if (!showSearch.value)
            IconButton(
              onPressed: () {
                showSearch.value = !showSearch.value;
              },
              icon: Icon(MIcons.magnify),
            ),
          IconButton(
            onPressed: () {
              ref.invalidate(filteredProductsControllerProvider(filter));
            },
            icon: Icon(MIcons.refresh),
          ),
        ],
        bottom: showSearch.value
            ? PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: textCtrl,
                              decoration: const InputDecoration(
                                  hintText: 'Type anything to filter...',
                                  border: InputBorder.none),
                              onFieldSubmitted: (value) =>
                                  searchQuery.value = value,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showSearch.value = !showSearch.value;
                            },
                            icon: Icon(MIcons.close),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ))
            : null,
      ),
      body: ProductList(
        filter: filter,
        builder: (products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductTile(
                size: 50,
                product: product,
                onTap: () async {
                  final result = await StoreProductUpdatePageRoute(product.id)
                      .push(context);
                  if (result is Product) {
                    ref.invalidate(filteredProductsControllerProvider(filter));
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
