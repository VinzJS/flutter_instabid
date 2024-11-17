import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:searchfield/searchfield.dart';

class BidFormField extends HookConsumerWidget {
  final String name;
  final Function(Bid?)? onChanged;
  final dynamic Function(Bid)? valueTransformer;

  const BidFormField({
    super.key,
    required this.name,
    this.onChanged,
    this.valueTransformer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<Bid>> search(String? query) async {
      final repo = ref.read(bidRepositoryProvider);
      final result = await repo.list(query: 'name ~ "$query"', pageNo: 1, pageSize: 10).run();
      return result.fold(Future.error, (r) => Future.value(r.items));
    }

    return CustomFormField<Bid>(
      name: name,
      onChanged: onChanged,
      onSearch: search,
      hint: 'Bid',
      valueTransformer: (p0) {
        final value = p0;
        if (value is Bid) return valueTransformer?.call(value);
      },
      selectedBuilder: (p0, controller) => ListTile(
        title: Text(p0.id),
        subtitle: const Text('project'),
        trailing: IconButton(
          onPressed: () {
            FormBuilder.of(context)?.fields[name]?.didChange(null);
            controller.clear();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      onChild: (p0) => SearchFieldListItem<Bid>(
        p0.id,
        item: p0,
        child: Text(p0.id),
      ),
    );
  }
}
