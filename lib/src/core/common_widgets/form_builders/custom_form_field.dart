import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:searchfield/searchfield.dart';

///
/// This is used for handling searchable dropdown fields
/// the `T` represents the type of the search result

class CustomFormField<T> extends HookConsumerWidget {
  final String name;
  final bool enabled;
  final Function(T?)? onChanged;
  final Future<List<T>> Function(String?) onSearch;
  final SearchFieldListItem<T> Function(T) onChild;
  final Widget Function(T, TextEditingController) selectedBuilder;
  final String? hint;
  final Duration debounce;
  final dynamic Function(Object?)? valueTransformer;

  const CustomFormField({
    super.key,

 
    this.enabled = true,

 
    this.valueTransformer,

    required this.name,

 
    required this.onChanged,

  
    required this.onSearch,

  
    required this.onChild,

 
    required this.selectedBuilder,

  
    this.hint,

    this.debounce = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fieldKey = useMemoized(() => GlobalKey<FormBuilderFieldState>());
    final focus = useFocusNode();
    final searchResults = useState<List<T>>([]);
    final searchQuery = useState<String>('');
    final isEmpty = useState<bool>(true);
    final isLoading = useState<bool>(false);
    final debouncedQuery = useDebounced(searchQuery.value, debounce);
    final textCtrl = useTextEditingController();

    ///
    ///
    ///
    Future<void> search(String query) async {
      if (query.isEmpty) {
        searchResults.value = [];
        return;
      }
      isLoading.value = true;

      final result = await TaskResult.tryCatch(
        () => onSearch(query),
        Failure.presentation,
      ).run();

      result.fold((l) {}, (r) {
        isEmpty.value = r.isEmpty;
        searchResults.value = r;
      });
      isLoading.value = false;
    }

    useEffect(() {
      if (debouncedQuery != null && debouncedQuery.isNotEmpty) {
        search(debouncedQuery);
      }
      return null;
    }, [debouncedQuery]);

    return FormBuilderField(
      key: fieldKey,
      valueTransformer: valueTransformer,
      name: name,
      enabled: enabled,
      onChanged: (value) {
        if (value is T) onChanged?.call(value);
      },
      builder: (field) {
        final value = field.value;

        final suggestions = searchResults.value

            /// where type is used to filter the to match the T
            .whereType<T>()
            .map(onChild)
            .toList();

        ///
        /// search field
        ///
        return Column(
          children: [
            ///
            /// this will be the widget to show when there is a selected value
            ///
            if (value is T) selectedBuilder.call(value, textCtrl),

            ///
            /// Search Field
            ///
            Offstage(
              offstage: value != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SearchField<T>(
                  controller: textCtrl,
                  hint: hint,
                  focusNode: focus,
                  emptyWidget: Builder(builder: (context) {
                    ///
                    /// will display a loading indicator while searching
                    ///
                    if (isLoading.value) {
                      return const SizedBox(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    ///
                    /// will display and empty widget if there are no results
                    ///
                    if (isEmpty.value) {
                      return const SizedBox(
                        height: 200,
                        child: Center(
                          child: Text('No results found'),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),

                  ///
                  /// this are where the results will be displayed
                  /// if there are no results,
                  ///
                  suggestions: suggestions,
                  onSuggestionTap: (x) {
                    field.didChange(x.item);
                    focus.unfocus();
                  },
                  onSearchTextChanged: (query) {
                    searchQuery.value = query;
                    return;
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
