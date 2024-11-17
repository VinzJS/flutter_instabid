import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class AuthBuilder extends HookConsumerWidget {
  final Widget Function(User) builder;

  const AuthBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    return state.when(
      data: builder,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const SizedBox(),
    );
  }
}
