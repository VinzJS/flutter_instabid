import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class OrderList extends HookConsumerWidget {
  final String filter;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget Function(BuildContext context, Order order)? builder;

  const OrderList({
    super.key,
    required this.filter,
    this.shrinkWrap = false,
    this.physics,
    this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = filteredOrdersControllerProvider(filter);
    final state = ref.watch(provider);

    return state.when(
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
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];

            return builder?.call(context, order) ?? OrderTile(order: order);
          },
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
