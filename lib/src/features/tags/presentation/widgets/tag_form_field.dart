import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:searchfield/searchfield.dart';

class TagFormField extends HookConsumerWidget {
  final String name;
  final Function(Tag?)? onChanged;
  final dynamic Function(Tag)? valueTransformer;

  const TagFormField({
    super.key,
    required this.name,
    this.onChanged,
    this.valueTransformer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<Tag>> search(String? query) async {
      final repo = ref.read(tagRepositoryProvider);
      final result = await repo.list(query: 'name ~ "$query"', pageNo: 1, pageSize: 10).run();
      return result.fold(Future.error, (r) => Future.value(r.items));
    }

    return CustomFormField<Tag>(
      name: name,
      onChanged: onChanged,
      onSearch: search,
      hint: 'Tag',
      valueTransformer: (p0) {
        final value = p0;
        if (value is Tag) return valueTransformer?.call(value);
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
      onChild: (p0) => SearchFieldListItem<Tag>(
        p0.id,
        item: p0,
        child: Text(p0.id),
      ),
    );
  }
}
