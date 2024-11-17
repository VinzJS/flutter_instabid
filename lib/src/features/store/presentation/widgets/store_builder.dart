import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreBuilder extends HookConsumerWidget {
  final String id;
  final Widget Function(StoreFront) builder;
  final Widget Function(dynamic, StackTrace)? onError;
  final Widget Function()? onLoading;

  const StoreBuilder({
    super.key,
    required this.id,
    required this.builder,
    this.onError,
    this.onLoading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storeControllerProvider(id));
    return state.when(
      skipError: false,
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      data: builder,
      error: (error, stackTrace) =>
          onError?.call(error, stackTrace) ??
          Text(
            error.toString(),
          ),
      loading: () =>
          onLoading?.call() ??
          const Center(
            child: CircularProgressIndicator(),
          ),
    );
  }
}
