import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoreCreatePage extends HookConsumerWidget {
  const StoreCreatePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Store'),
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}
