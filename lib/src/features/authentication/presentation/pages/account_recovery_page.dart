import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountRecoveryPage extends HookConsumerWidget {
  const AccountRecoveryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          const Placeholder(
            child: Text('Account Recovery'),
          ),
          const ListTile(
            title: Text('Email'),
            subtitle: TextField(),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Send Email Recovery'),
          ),
        ],
      ),
    );
  }
}
