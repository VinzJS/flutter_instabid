import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class ProductBuilder extends HookConsumerWidget {
  final Widget Function(Product) builder;
  final Widget Function(dynamic, StackTrace)? failureBuilder;
  final Widget Function()? loadingBuilder;
  final String id;

  const ProductBuilder({
    super.key,
    required this.builder,
    this.failureBuilder,
    this.loadingBuilder,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productControllerProvider(id));
    return state.when(
      skipError: false,
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      data: builder,
      error: (error, stack) => failureBuilder?.call(error, stack) ?? SizedBox(),
      loading: () => loadingBuilder?.call() ?? const Center(child: CircularProgressIndicator()),
    );
  }
}
