import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class StoreOrderPage extends HookConsumerWidget {
  const StoreOrderPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    /// Submits the form and if successful, pops the route with the new [Order]
    /// otherwise shows a snackbar with the error message.
    onSubmit() async {
      isLoading.value = true;
      final result = await TaskResult.Do(($) async {
        final form = await $(FormUtils.getFormState(formKey.currentState));
        final values = await $(FormUtils.getFormValues(form));
        final repo = ref.read(orderRepositoryProvider);
        final order = await $(repo.get(id));
        return await $(repo.update(order, values));
      }).run();

      result.fold(
        (l) {
          AppSnackBar.rootFailure(l);
        },
        (r) {
          AppSnackBar.root(message: 'Order updated successfully');
          if (context.mounted) context.pop<Order>(r);
        },
      );
      isLoading.value = false;
    }

    final state = ref.watch(orderUpdateControllerProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: state.when(
        data: (params) {
          final user = params.user;
          final product = params.product;
          return FormBuilder(
            key: formKey,
            initialValue: {
              OrderField.amount: 0.toString(),
              OrderField.product: product,
              OrderField.productCopy: product.toJson(),
              OrderField.user: user,
              OrderField.status: OrderStatus.pending,
              OrderField.price: product.price,
            },
            child: CustomScrollView(
              slivers: [
                SliverList.list(children: [
                  ///
                  /// Hidden Field
                  ///
                  FormHiddenFields(
                    ids: [
                      OrderField.productCopy,
                      OrderField.price,
                    ],
                  ),

                  ///
                  /// user field
                  ///
                  UserFormField(
                    enabled: false,
                    name: OrderField.user,
                    valueTransformer: (User v) => v.id,
                  ),

                  ///
                  /// product field
                  ///
                  ProductFormField(
                    enabled: false,
                    name: OrderField.product,
                    valueTransformer: (p0) => p0.id,
                  ),

                  /// Status
                  ///
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: OrderStatusField(
                      enabled: true,
                      decoration: const InputDecoration(
                        labelText: 'Status',
                      ),
                      name: OrderField.status,
                      valueTransformer: (p0) => p0?.name,
                    ),
                  ),

                  ///
                  /// Amount
                  ///
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: CurrencyFormField(
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                      ),
                      name: OrderField.amount,
                      allowDecimal: false,
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
        },
        error: (error, stackTrace) {
          return const Center(child: Text('Something went wrong...'));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
