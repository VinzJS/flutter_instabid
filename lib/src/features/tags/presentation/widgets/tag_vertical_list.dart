import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class TagVerticalList extends HookConsumerWidget {
  const TagVerticalList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tagsControllerProvider);

    return SizedBox(
      height: 120,
      child: state.when(
          skipError: false,
          skipLoadingOnRefresh: false,
          skipLoadingOnReload: false,
          error: (error, stackTrace) {
            return Center(child: Text(error.toString()));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (list) {
            return ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final tag = list[index];
                return TagAvatar(tag: tag);
              },
            );
          }),
    );
  }
}
