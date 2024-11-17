import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicOrderPage extends HookConsumerWidget {
  final String id;

  const PublicOrderPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = orderControllerProvider(id);
    final state = ref.watch(provider);

    return state.when(
        data: (order) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: Text('Order Details'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        ref.invalidate(provider);
                      },
                    )
                  ],
                ),
                SliverList.list(children: [
                  ///
                  /// Status Banner
                  ///
                  OrderBanner(order: order),
                  ListTile(
                    title: Text('Order: ${order.id}'),
                  ),
                  Divider(),

                  ListTile(
                    title: Text(
                      'Product',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final product = order.productCopy;

                      return ProductCard(product: product);
                    },
                  ),

                  Divider(),

                  ///
                  /// Quantity
                  ///
                  ListTile(
                    title: Row(
                      children: [
                        Text('Quantity: '),
                        Text(order.amount.toString()),
                      ],
                    ),
                  ),

                  ///
                  /// Total
                  ///
                  ListTile(
                    title: Row(
                      children: [
                        Text('Total: '),
                        Text(order.total.toString()),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          );
        },
        error: (error, stack) => Scaffold(
              appBar: AppBar(title: Text('Something went wrong...')),
              body: Center(
                child: Text('Something went wrong. Unable to load order.'),
              ),
            ),
        loading: () => Scaffold(
              appBar: AppBar(title: const Text('Loading...')),
              body: const Center(child: CircularProgressIndicator()),
            ));
  }
}
