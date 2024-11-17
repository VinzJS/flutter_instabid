import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicOrdersPage extends HookConsumerWidget {
  const PublicOrdersPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = myOrdersControllerProvider;
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        actions: [
          ///
          /// refresh button
          ///
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(provider),
          ),
        ],
      ),
      body: state.when(
        skipError: false,
        skipLoadingOnRefresh: false,
        skipLoadingOnReload: false,
        data: (result) {
          final orders = result;

          if (orders.isEmpty) {
            return const Center(
              child: Text('No orders found'),
            );
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Card(
                elevation: .2,
                child: ListTile(
                  leading: ProductImage.circle(order.productCopy, width: 80),
                  onTap: () => PublicOrderPageRoute(order.id).push(context),
                  title: Text(
                    order.orderStatus.name,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.productCopy.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text('Qty: ${order.amount}'),
                      Text('Total: ${order.total}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
