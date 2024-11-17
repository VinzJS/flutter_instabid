import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreDashboardPage extends HookConsumerWidget {
  final String id;

  const StoreDashboardPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StoreBuilder(
      id: id,
      onError: (error, stackTrace) => Scaffold(
        appBar: AppBar(
          title: Text(error.toString()),
        ),
        body: Center(
          child: Text(error.toString()),
        ),
      ),
      onLoading: () => Scaffold(
        appBar: AppBar(
          title: const Text('Loading...'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      builder: (store) {
        return Scaffold(
          appBar: AppBar(
            title: Text(store.name),
          ),
          body: Column(
            children: [
              ///
              /// Details
              ///
              ListTile(
                onTap: () => StoreUpdatePageRoute(id).push(context),
                title: Text('Your Store'),
                subtitle: Text('Manage your store details'),
                trailing: Icon(Icons.chevron_right),
              ),

              ///
              /// Store Products
              ///
              ListTile(
                onTap: () => StoreProductSelectPageRoute(id).push(context),
                title: Text('Products'),
                subtitle: Text('Manage your store products'),
                trailing: Icon(Icons.chevron_right),
              ),

              ///
              /// Store Bids
              ///
              ListTile(
                onTap: () => StoreBidsSelectPageRoute(id).push(context),
                title: Text('Bids'),
                subtitle: Text('Manage your store bids'),
                trailing: Icon(Icons.chevron_right),
              ),

              ///
              /// Orders
              ///
              ListTile(
                onTap: () => StoreOrdersPageRoute(id).push(context),
                title: Text('Orders'),
                subtitle: Text('Manage your store Orders'),
                trailing: Icon(Icons.chevron_right),
              ),
            ],
          ),
        );
      },
    );
  }
}
