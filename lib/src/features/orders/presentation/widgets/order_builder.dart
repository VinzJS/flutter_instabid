import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class OrderBuilder extends HookConsumerWidget {
  final Widget Function(Order) builder;
  final String id;

  const OrderBuilder({super.key, required this.builder, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderControllerProvider(id));
    return state.when(
      data: builder,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const SizedBox(),
    );
  }
}
