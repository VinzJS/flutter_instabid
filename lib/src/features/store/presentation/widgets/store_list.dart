import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreList extends HookConsumerWidget {
  final String filter;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget Function(StoreFront) builder;

  const StoreList(
      {super.key,
      required this.filter,
      this.shrinkWrap = false,
      this.physics,
      required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = filteredStoresControllerProvider(filter);
    final state = ref.watch(provider);

    return state.when(
      skipError: false,
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      data: (result) {
        final products = result;
        final list = result;

        if (list.isEmpty) {
          return const Center(
            child: Text('No Stores found'),
          );
        }

        return ListView.builder(
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final store = list[index];
            return builder.call(store);
          },
        );
      },
      error: (error, stackTrace) {
        return const SizedBox();
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
