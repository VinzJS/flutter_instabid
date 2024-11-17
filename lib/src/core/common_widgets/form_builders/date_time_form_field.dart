import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:intl/intl.dart';

class DateTimeFormField extends HookConsumerWidget {
  final String startName;
  final String endName;
  final bool enabled;
  final InputDecoration durationDecoration;
  final InputDecoration startDecoration;
  final InputDecoration endDecoration;
  final dynamic Function(DateTime?)? startValueTransformer;
  final dynamic Function(DateTime?)? endValueTransformer;
  final String? Function(DateTime?)? startValidator;
  final String? Function(DateTime?)? endValidator;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateTimeFormField({
    super.key,
    required this.startName,
    required this.endName,
    this.enabled = true,
    this.startValueTransformer,
    this.endValueTransformer,
    this.firstDate,
    this.lastDate,
    this.startValidator,
    this.endValidator,
    this.durationDecoration = const InputDecoration(),
    this.startDecoration = const InputDecoration(),
    this.endDecoration = const InputDecoration(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onChange() {
      final form = FormBuilder.of(context);
      var start = form?.instantValue[startName];
      if (start is String) {
        try {
          start = DateTime.tryParse(start);
        } catch (e) {
          AppSnackBar.root(message: 'Failed to parse start date');
        }
      }
      final duration = form?.instantValue['_duration'];
      if (start is DateTime && duration is String) {
        final startCopy = start.copyWith();
        startCopy.add(Duration(days: 1));
        final end = startCopy
            .add(Duration(hours: int.parse(duration.split(' ').first)));
        form?.fields[endName]?.didChange(end);
      } else {
        AppSnackBar.root(message: 'Something went wrong...');
      }
    }

    return Column(
      children: [
        FormBuilderDateTimePicker(
          focusNode: FocusNode(),
          autofocus: false,
          name: startName,
          enabled: enabled,
          decoration: startDecoration.copyWith(
            suffix: IconButton(
              icon: Icon(MIcons.close),
              onPressed: () {
                final form = FormBuilder.of(context);
                form?.fields[startName]?.didChange(null);
              },
            ),
          ),
          valueTransformer: startValueTransformer,
          validator: startValidator,
          format: DateFormat('MMM d, yyyy h:mm a'),
          onChanged: (x) => onChange(),
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: DateTime.now(),
        ),
        SizedBox(height: 16),
        FormBuilderDateTimePicker(
          name: endName,
          enabled: false,
          decoration: endDecoration,
          valueTransformer: endValueTransformer,
          // validator: endValidator,
          format: DateFormat('MMM d, yyyy h:mm a'),
        ),
        SizedBox(height: 16),
        FormBuilderDropdown(
          name: '_duration',
          onChanged: (x) => onChange(),
          decoration: durationDecoration.copyWith(
            labelText: 'Duration',
          ),
          items: [
            for (int i = 1; i <= 24; i++) i == 1 ? '$i Hour' : '$i Hours',
          ]
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          initialValue: '1 Hour',
        ),
      ],
    );
  }
}
