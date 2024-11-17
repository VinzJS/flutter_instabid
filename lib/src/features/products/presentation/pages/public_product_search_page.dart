import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicProductSearchPage extends HookConsumerWidget {
  const PublicProductSearchPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = useState<String?>(null);

    final textCtrl = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: 'Type anything here...'),
          controller: textCtrl,
          onSubmitted: (x) {
            query.value = x;
          },
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       query.value = textCtrl.text;
        //     },
        //     icon: const Icon(Icons.search),
        //   ),
        // ],
      ),
      body: Builder(
        builder: (context) {
          final text = query.value;
          if (text is String) return ProductSearchResult(query: text);
          return const SizedBox();
        },
      ),
    );
  }
}

class ProductSearchResult extends HookConsumerWidget {
  final String query;

  const ProductSearchResult({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = productsFilteredControllerProvider(query);
    final state = ref.watch(provider);

    return CustomScrollView(
      slivers: [
        state.when(
          skipError: false,
          skipLoadingOnRefresh: false,
          skipLoadingOnReload: false,
          data: (products) {
            return ProductGrid.sliver(products);
          },
          error: (error, stackTrace) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  error.toString(),
                ),
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
    );
  }
}
