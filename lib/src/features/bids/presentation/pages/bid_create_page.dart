import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class BidCreatePage extends HookConsumerWidget {
  /// id of the product
  final String id;

  const BidCreatePage({super.key, required this.id});

  ///
  ///
  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    /// will determine if the form is loading
    ///
    final isLoading = useState(false);

 
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    ///
    /// BidCreateController State
    ///
    final state = ref.watch(bidCreateControllerProvider(id));

 
    onSubmit() async {
      final confirmResult = await ConfirmModal.show(
        context,
        cancel: 'Cancel',
        confirm: 'Submit',
        message: 'You can not change your bid once submitted',
        showCancelFirst: true,
      );
      if (confirmResult != true) return;

      isLoading.value = true;
      final result = await TaskResult.Do(($) async {
        final form = await $(FormUtils.getFormState(formKey.currentState));
        final values = await $(FormUtils.getFormValues(form));
        final repo = ref.read(bidRepositoryProvider);
        return await $(repo.create(values));
      }).run();

      result.fold(
        (l) {
          AppSnackBar.rootFailure(l);
        },
        (r) {
          /// refresh the product details so force to refresh
          ref.invalidate(productControllerProvider(id));

          /// return to the previous page
          context.pop(r);
        },
      );
      isLoading.value = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit your Bid'),
      ),
      body: state.when(
          data: (params) {
            final bid = params.bid;
            final product = params.product;
            final user = params.user;

            if (bid != null) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Bid already submitted',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('You already have an active bid'),
                ],
              ));
            }

            return FormBuilder(
              key: formKey,
              initialValue: {
                /// why string because forms of form builder does not acccept it.
                BidField.amount: 0.toString(),
                BidField.product: product,
                BidField.user: user,
              },
              child: CustomScrollView(
                slivers: [
                  SliverList.list(
                    children: [
                      ///
                      /// field
                      ///
                      ProductFormField(
                        enabled: false,
                        name: BidField.product,
                        valueTransformer: (p0) => p0.id,
                      ),

                      UserFormField(
                        enabled: false,
                        name: BidField.user,
                        valueTransformer: (p0) => p0.id,
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList.list(children: [
                      ///
                      /// Fields you cannot see
                      ///
                      HiddenFormField(name: BidField.user),

                      ///
                      /// Curreny Form Field
                      ///
                      CurrencyFormField(
                        name: BidField.amount,
                        allowDecimal: true,
                        decoration: InputDecoration(label: Text('Bid value')),
                      ),

                      SizedBox(height: 30),

                      ///
                      /// submit
                      ///
                      LoadingFilledButton(
                        isLoading: isLoading.value,
                        onPressed: onSubmit,
                        child: const Text('Submit'),
                      ),
                    ]),
                  )
                ],
              ),
            );
          },
          error: (error, stack) => Center(
                child: Text('Something wrong has happened'),
              ),
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
