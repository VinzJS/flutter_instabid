import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class PublicBidsPage extends HookConsumerWidget {
  const PublicBidsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);

    return Scaffold(
      body: state.when(
          skipError: false,
          data: (user) {
            return Scaffold(
              appBar: AppBar(
                title: Text('You Bids'),
              ),
              body: BidList(
                filter: 'user = "${user.id}" ',
                builder: (bid) {
                  return BidTile(
                    bid: bid,
                    onTap: () => PublicBidPageRoute(bid.id).push(context),
                  );
                },
              ),
            );
          },
          error: (error, stack) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Your Bids'),
              ),
              body: const Center(child: Text('Something went wrong')),
            );
          },
          loading: () => Scaffold(
                appBar: AppBar(
                  title: Text('Your Bids'),
                ),
                body: Center(child: CircularProgressIndicator()),
              )),
    );
  }
}
