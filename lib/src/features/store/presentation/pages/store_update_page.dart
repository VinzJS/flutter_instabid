import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class StoreUpdatePage extends HookConsumerWidget {
  const StoreUpdatePage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final provider = storeControllerProvider(id);
    final state = ref.watch(provider);

    /// Retrieves the current store from the auth controller

    /// Submits the form and if successful, pops the route with the new [Bid]
    /// otherwise shows a snackbar with the error message.
    void onSubmit() async {
      isLoading.value = true;
      final result = await TaskResult.Do(($) async {
        final form = await $(FormUtils.getFormState(formKey.currentState));
        final values = await $(FormUtils.getFormValues(form));
        final repo = ref.read(storeRepositoryProvider);
        final store = await $(repo.get(id));
        return $(repo.update(store, values));
      }).run();

      result.fold(
        (l) {
          if (!context.mounted) return;

          AppSnackBar.rootFailure(l);
        },
        (r) {
          if (!context.mounted) return;
          ref.invalidate(provider);
          context.pop<Store>(null);
        },
      );
      isLoading.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Update'),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text(e.toString())),
        data: (store) {
          return FormBuilder(
            key: formKey,
            initialValue: store.toMap(),
            enabled: isLoading.value == false,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList.list(children: [
                    ///
                    /// Change Profile Picture
                    ///
                    CustomImageField(
                      feature: 'stores',
                      id: id,
                      name: StoreField.displayImage,
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
                          feature: 'stores',
                          file: value,
                          id: store.id,
                        );
                      },
                    ),
                    SizedBox(height: 18),

                    ///
                    /// name
                    ///
                    FormBuilderTextField(
                      name: StoreField.name,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                    ),
                    SizedBox(height: 18),

                    ///
                    /// Description
                    ///
                    FormBuilderTextField(
                      name: StoreField.description,
                      decoration: const InputDecoration(
                        label: Text('description'),
                      ),
                    ),

                    SizedBox(height: 18),

                    ///
                    /// ContactNumber
                    ///
                    FormBuilderTextField(
                      name: StoreField.contactNumber,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: '+63###-###-####',
                          filter: {"#": RegExp(r'[0-9]')},
                        ),
                      ],
                      decoration: const InputDecoration(
                        label: Text('Contact Number'),
                      ),
                    ),
                    SizedBox(height: 18),

                    FormBuilderCheckbox(
                      name: StoreField.isPublished,
                      title: Text('Is Published'),
                    ),

                    SizedBox(height: 18),

                    ///
                    /// Address
                    ///
                    FormBuilderTextField(
                      name: StoreField.address,
                      decoration: const InputDecoration(
                        label: Text('Address'),
                      ),
                    ),

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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
