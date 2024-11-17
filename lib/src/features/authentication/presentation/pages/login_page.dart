import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authControllerProvider.notifier);

    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final isLoading = useState(false);
    final isPasswordVisible = useState(false);

    Future<void> onLogin() async {
      isLoading.value = true;
      final result = await TaskResult.Do(($) async {
        final form = await $(FormUtils.getFormState(formKey.currentState));
        final values = await $(FormUtils.getFormValues(form));

        return $(
          ref.read(authControllerProvider.notifier).login(
                email: values['email'],
                password: values['password'],
              ),
        );
      }).run();
      isLoading.value = false;

      result.fold(
        (l) {
          if (context.mounted) isLoading.value = false;
          AppSnackBar.rootFailure(l);
        },
        (r) {
          if (context.mounted) const RootRoute().go(context);
          AppSnackBar.root(message: 'success');
        },
      );
    }

    void togglePasswordVisibility() {
      isPasswordVisible.value = !isPasswordVisible.value;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(MIcons.cogOutline),
            onPressed: () {
              const DomainPageRoute().push(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            FormBuilder(
              key: formKey,
              enabled: !isLoading.value,
              child: Column(
                children: [
                  Assets.icons.appIconTransparent.image(width: 250),
                  FormBuilderTextField(
                    name: 'email',
                    onSubmitted: (_) => onLogin(),
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  FormBuilderTextField(
                    name: 'password',
                    obscureText: !isPasswordVisible.value,
                    onSubmitted: (_) => onLogin(),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: togglePasswordVisibility,
                        icon: Icon(
                          !isPasswordVisible.value
                              ? MIcons.eyeOutline
                              : MIcons.eyeOffOutline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///
            /// Forget Password
            ///
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 130,
                child: TextButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                  ),
                  child: const Text('Forget Password'),
                  onPressed: () => const AccountRecoveryPageRoute().go(context),
                ),
              ),
            ),

            ///
            /// Login Button
            ///
            const SizedBox(height: 20),
            LoadingFilledButton(
              onPressed: onLogin,
              showText: false,
              isLoading: isLoading.value,
              child: const Text('Login'),
            ),

            ///
            /// register button
            ///
            const SizedBox(height: 20),
            TextButton(
              child: const Text('Register Account'),
              onPressed: () => const RegistrationPageRoute().go(context),
            ),
          ],
        ),
      ),
    );
  }
}
