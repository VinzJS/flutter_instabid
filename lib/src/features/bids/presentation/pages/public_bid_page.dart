import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicBidPage extends HookConsumerWidget {
  final String id;

  const PublicBidPage({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bidViewControllerProvider(id));

    return Scaffold(
      body: state.when(
        loading: () =>
            Scaffold(body: const Center(child: CircularProgressIndicator())),
        error: (error, stack) =>
            Scaffold(body: Center(child: Text(error.toString()))),
        data: (state) {
          final product = state.product;
          final bid = state.bid;

          ///
          /// Build the status
          ///
          Widget buildStatus(Product product) {
            if (product.canStillBid) return Text('Bidding is still open');
            if (bid.id == product.bid) {
              return Text('Bid Won');
            }
            return Text('Bid Lost');
          }

          return CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(product.name),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///
                    /// Details of the product
                    ///
                    ProductTile(product: product),
                    Divider(),
                    ListTile(
                      title: buildStatus(product),
                      subtitle: Text('Status'),
                    ),
                    ListTile(
                      title: Text(bid.amount.toString()),
                      subtitle: Text('You bid amount'),
                    ),
                    ListTile(
                      title: Text(bid.created.yyyyMMddHHmmA()),
                      subtitle: Text('Created'),
                    ),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
