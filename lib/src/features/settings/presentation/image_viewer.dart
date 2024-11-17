import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class ImageViewer extends ConsumerWidget {
  const ImageViewer({
    super.key,
    required this.builder,
    required this.feature,
    required this.file,
    required this.id,
    this.loader,
    this.error,
  });

  final String feature;
  final String id;
  final String file;
  final Widget Function(String url) builder;
  final Widget Function()? loader;
  final Widget Function()? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<String?> buildUrl() async {
      final result = await TaskResult.Do(($) async {
        final repo = ref.read(settingRepositoryProvider);
        final setting = await $(repo.get());
        final url = '${setting.domain}/api/files/$feature/$id/$file';
        return url;
      }).run();
      return result.fold((l) => null, (r) => r);
    }

    return FutureBuilder<String?>(
      future: buildUrl(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return error?.call() ?? Container();
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) return error?.call() ?? Container();
          final url = snapshot.data!;
          return builder(url);
        } else {
          return loader?.call() ??
              const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
