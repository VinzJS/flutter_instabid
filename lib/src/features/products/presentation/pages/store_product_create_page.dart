import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreProductCreatePage extends HookConsumerWidget {
  // storeId
  final String id;

  const StoreProductCreatePage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final isBiddable = useState(false);

    onChange() async {
      final result = await TaskResult.Do(($) async {
        final form = await $(FormUtils.getFormState(formKey.currentState));
        final values = await $(FormUtils.getFormValues(form));
        isBiddable.value = values[ProductField.isBiddable] ?? false;
      }).run();
    }

    /// Submits the form and if successful, pops the route with the new [Product]
    /// otherwise shows a snackbar with the error message.
    onSubmit() async {
      isLoading.value = true;
      final result = await TaskResult.Do(($) async {
        final form = await $(FormUtils.getFormState(formKey.currentState));
        final values = await $(FormUtils.getFormValues(form));
        final repo = ref.read(productRepositoryProvider);
        return await $(repo.create(values));
      }).run();

      result.fold(
        (l) {
          AppSnackBar.rootFailure(l);
        },
        (r) {
          AppSnackBar.root(message: 'Product created successfully');
          if (context.mounted) context.pop<Product>(r);
        },
      );
      isLoading.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Product'),
      ),
      body: AuthBuilder(builder: (user) {
        return FormBuilder(
          key: formKey,
          onChanged: onChange,
          initialValue: {
            ProductField.store: id,
            ProductField.isBiddable: false,
            ProductField.bidStart: DateTime.now(),
            ProductField.bidEnd: DateTime.now().add(Duration(hours: 1)),
          },
          child: CustomScrollView(
            slivers: [
              SliverList.list(children: [
                ///
                /// Hidden Field
                ///
                FormHiddenFields(
                  ids: [
                    ProductField.store,
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(18),
                  child: CustomNewImageField(
                    name: ProductField.displayImage,
                  ),
                ),

                ///
                /// name
                ///
                Padding(
                  padding: EdgeInsets.all(18),
                  child: FormBuilderTextField(
                    name: ProductField.name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(18),
                  child: FormBuilderTextField(
                    name: ProductField.description,
                    minLines: 2,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Descrtiption',
                    ),
                  ),
                ),

                ///
                /// Price
                ///
                Padding(
                  padding: EdgeInsets.all(18),
                  child: CurrencyFormField(
                    decoration: const InputDecoration(
                      labelText: 'Price',
                    ),
                    name: ProductField.price,
                    allowDecimal: true,
                  ),
                ),

                ///
                /// isBiddable
                ///
                Padding(
                  padding: EdgeInsets.all(18),
                  child: YesNoFormField(
                    name: ProductField.isBiddable,
                    enabled: true,
                    decoration: const InputDecoration(labelText: 'Is Biddable'),
                  ),
                ),
              ]),

              if (isBiddable.value)
                SliverList.list(children: [
                  ///
                  /// Bid Start
                  ///
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: DateTimeFormField(
                      startName: ProductField.bidStart,
                      endName: ProductField.bidEnd,
                      startValueTransformer: (value) =>
                          value?.toIso8601String(),
                      endValueTransformer: (value) => value?.toIso8601String(),
                      startDecoration: const InputDecoration(
                        labelText: 'Bid Start',
                      ),
                      endDecoration: const InputDecoration(
                        labelText: 'Bid End',
                      ),
                    ),
                  ),
                ]),

              SliverToBoxAdapter(child: SizedBox(height: 20)),

              ///
              /// submit button
              ///
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoadingFilledButton(
                    isLoading: isLoading.value,
                    onPressed: onSubmit,
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
