import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class ProductBottomBar extends HookConsumerWidget {
  final Product product;

  const ProductBottomBar({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    /// will trigger when bid now is pressed.
    ///
    onBid() async {
      ///
      /// show error when the product is not suitable for bidding
      ///
      final cannotBid = !product.canStillBid;
      if (cannotBid) {
        await ConfirmModal.show(
          context,
          message: 'You can no longer bid on this product.',
          confirm: 'OK',
          title: 'Cannot Bid',
        );
        return;
      }

      ///
      /// this will redirect you to the bid create page
      ///
      BidCreatePageRoute(product.id).push(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (product.isBiddable)
          SizedBox(
            width: double.maxFinite,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: product.canStillBid
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.error,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: ElapsedTimeView(
                  startTime: product.bidStartDate ?? DateTime.now(),
                  endTime: product.bidEndDate ?? DateTime.now(),
                  currentTime: DateTime.now(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: product.canStillBid
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onError,
                      ),
                ),
              ),
            ),
          ),
        BottomAppBar(
          elevation: 1,
          child: Row(children: [
            /// Store Button
            TextButton.icon(
              label: const Text('Store'),
              onPressed: () {
                final id = product.store;
                PublicStorePageRoute(id).push(context);
              },
              icon: Icon(MIcons.storeOutline),
            ),
            const Spacer(),

            product.isBiddable
                ? FilledButton(
                    onPressed: onBid,
                    child: const SizedBox(
                      width: 150,
                      height: 40,
                      child: Center(child: Text('Bid Now')),
                    ),
                  )
                : FilledButton(
                    onPressed: () =>
                        OrderCreatePageRoute(product.id).push(context),
                    child: const SizedBox(
                      width: 150,
                      height: 40,
                      child: Center(child: Text('Buy Now')),
                    ),
                  ),
          ]),
        ),
      ],
    );
  }
}
