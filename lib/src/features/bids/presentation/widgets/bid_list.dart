import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class BidList extends HookConsumerWidget {
  final String filter;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget Function(Bid)? builder;

  const BidList({
    super.key,
    required this.filter,
    this.shrinkWrap = false,
    this.physics,
    this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = filteredBidsControllerProvider(filter);
    final state = ref.watch(provider);

    return state.when(
      skipError: false,
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      data: (result) {
        final bids = result;

        if (bids.isEmpty) {
          return const Center(
            child: Text('No bids found'),
          );
        }

        return ListView.builder(
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: bids.length,
          itemBuilder: (context, index) {
            final bid = bids[index];
            if (builder != null) {
              return builder?.call(bid);
            }
            return BidTile(bid: bid);
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
