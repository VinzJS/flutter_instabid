import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreProductUpdatePage extends HookConsumerWidget {
  const StoreProductUpdatePage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final provider = productControllerProvider(id);
    final state = ref.watch(provider);

    /// Retrieves the current product from the auth controller

    /// Submits the form and if successful, pops the route with the new [Bid]
    /// otherwise shows a snackbar with the error message.
    void onSubmit() async {
      isLoading.value = true;
      final result = await TaskResult.Do(($) async {
        final form = await $(FormUtils.getFormState(formKey.currentState));
        final values = await $(FormUtils.getFormValues(form));
        final repo = ref.read(productRepositoryProvider);
        final product = await $(repo.get(id));
        return $(repo.update(product, values));
      }).run();

      result.fold(
        (l) {
          if (!context.mounted) return;
          AppSnackBar.rootFailure(l);
        },
        (r) {
          if (!context.mounted) return;
          AppSnackBar.root(message: 'Product updated successfully');
          ref.invalidate(provider);
          context.pop<Product>(r);
        },
      );
      isLoading.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Update'),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text(e.toString())),
        data: (product) {
          return FormBuilder(
            key: formKey,
            initialValue: {
              ...product.toFormMap(),
              ProductField.bidStart: DateTime.tryParse(product.bidStart ?? ''),
              ProductField.bidEnd: DateTime.tryParse(product.bidEnd ?? ''),
            },
            enabled: isLoading.value == false,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList.list(children: [
                    ///
                    ///
                    ///
                    FormHiddenFields(ids: [ProductField.isBiddable]),

                    ///
                    /// Change Profile Picture
                    ///
                    CustomImageField(
                      feature: 'products',
                      id: id,
                      name: ProductField.displayImage,
                      stringBuilder: (context, value) {
                        return ImageViewer(
                          builder: (url) => CachedNetworkImage(
                            height: 120,
                            width: 120,
                            imageUrl: url,
                            fit: BoxFit.fitWidth,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          feature: 'products',
                          file: value,
                          id: product.id,
                        );
                      },
                    ),
                    SizedBox(height: 18),

                    ///
                    /// name
                    ///
                    FormBuilderTextField(
                      name: ProductField.name,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                    ),

                    SizedBox(height: 18),

                    ///
                    /// Description
                    ///
                    FormBuilderTextField(
                      name: ProductField.description,
                      minLines: 2,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        label: Text('description'),
                      ),
                    ),

                    SizedBox(height: 18),

                    ///
                    /// Price
                    ///
                    CurrencyFormField(
                      decoration: const InputDecoration(
                        labelText: 'Price',
                      ),
                      name: ProductField.price,
                      allowDecimal: true,
                    ),

                    SizedBox(height: 18),

                    ///
                    /// Is Published
                    ///
                    FormBuilderCheckbox(
                      name: ProductField.isPublished,
                      title: Text('Is Published'),
                    ),
                  ]),
                ),
                if (product.isBiddable)
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
                        endValueTransformer: (value) =>
                            value?.toIso8601String(),
                        startDecoration: const InputDecoration(
                          labelText: 'Bid Start',
                        ),
                      ),
                    ),
                  ]),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList.list(children: [
                    ///
                    /// Spacer
                    ///
                    const SizedBox(height: 20),

                    ///
                    /// Submit
                    ///
                    LoadingFilledButton(
                      isLoading: isLoading.value,
                      onPressed: onSubmit,
                      child: const Text('Save'),
                    ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
