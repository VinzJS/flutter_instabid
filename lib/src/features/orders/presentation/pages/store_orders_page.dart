import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreOrdersPage extends HookConsumerWidget {
  const StoreOrdersPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: StoreBuilder(
          id: id,
          builder: (store) {
            final filter = 'product.store.id = "${store.id}"';
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: Text('Store Orders'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () => ref
                          .invalidate(filteredOrdersControllerProvider(filter)),
                    ),
                  ],
                ),
                SliverFillRemaining(
                  child: OrderList(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    filter: filter,
                    builder: (context, order) {
                      return ListTile(
                        onTap: () async {
                          final result =
                              await StoreOrderPageRoute(order.id).push(context);
                          if (result is Order) {
                            ref.invalidate(
                                filteredOrdersControllerProvider(filter));
                          }
                        },
                        title: Text(
                          order.productCopy.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Status: ${order.orderStatus.name}'),
                            Text('Total: ${order.total}'),
                            Text('Quantity: ${order.amount}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
