import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class OrderStatusField extends HookConsumerWidget {
  final String _name;
  final bool _enabled;
  final dynamic Function(OrderStatus?)? _valueTransformer;
  final InputDecoration _decoration;

  const OrderStatusField(
      {super.key,
      required bool enabled,
      required String name,
      InputDecoration decoration = const InputDecoration(),
      dynamic Function(OrderStatus?)? valueTransformer})
      : _name = name,
        _enabled = enabled,
        _decoration = decoration,
        _valueTransformer = valueTransformer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderDropdown<OrderStatus>(
      name: _name,
      enabled: _enabled,
      valueTransformer: _valueTransformer,
      decoration: _decoration,
      initialValue: OrderStatus.pending,
      items: OrderStatus.values
          .where((element) => element != OrderStatus.unkown)
          .map((e) => DropdownMenuItem<OrderStatus>(
                value: e,
                child: Text(e.name),
              ))
          .toList(),
    );
  }
}
