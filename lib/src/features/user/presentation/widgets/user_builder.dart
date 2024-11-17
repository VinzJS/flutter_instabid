import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class UserBuilder extends HookConsumerWidget {
  final String id;
  final Widget Function(User) builder;

  const UserBuilder({super.key,required this.id, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userControllerProvider(id));
    return state.when(
      data: builder,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const SizedBox(),
    );
  }
}
