import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreTile extends HookConsumerWidget {
  final String storeId;

  const StoreTile({
    super.key,
    required this.storeId,
  });

  static Widget optional(String? storeId) {
    if (storeId == null) {
      return const SizedBox();
    }
    return StoreTile(storeId: storeId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storeControllerProvider(storeId));

    return state.maybeWhen(
        data: (store) => ListTile(
              leading: StoreImage.circle(store),
              title: Text(store.name),
              trailing: OutlinedButton(
                onPressed: () {
                  PublicStorePageRoute(store.id).push(context);
                },
                child: const Text('View'),
              ),
            ),
        orElse: () => SizedBox());
  }
}
