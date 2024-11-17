import 'package:flutter/material.dart';
import 'package:instabid/src/_index.dart';

class BidTile extends StatelessWidget {
  final Bid bid;
  final Function()? onTap;

  const BidTile({
    super.key,
    required this.bid,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildStatus(Product product) {
      if (product.canStillBid) return Text('Bid is still open');
      if (bid.id == product.bid) {
        return Text('Bid Won');
      }
      return Text('Bid Lost');
    }

    return ProductBuilder(
      id: bid.product,
      builder: (product) {
        return ListTile(
          isThreeLine: true,
          leading: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 30),
            child: ProductImage(product: product),
          ),
          onTap: onTap,
          title: Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your bid: ${bid.amount}'),
              Row(
                children: [
                  Text('Status: '),
                  buildStatus(product),
                ],
              )
            ],
          ),
          trailing: const Icon(Icons.chevron_right),
        );
      },
    );
  }
}
