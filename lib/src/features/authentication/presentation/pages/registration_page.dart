import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authControllerProvider.notifier);

    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordConfirmController = useTextEditingController();
    final isLoading = useState(false);

    onRegister() async {
      isLoading.value = true;
      final result = await notifier
          .register(
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text,
            passwordConfirm: passwordConfirmController.text,
          )
          .run();
      isLoading.value = false;

      result.fold(
        (l) {
          if (context.mounted) isLoading.value = false;
          AppSnackBar.rootError(message: l.toString());
        },
        (r) {
          if (context.mounted) const RootRoute().go(context);
          AppSnackBar.root(message: 'success');
        },
      );
    }

    final passwordVisibility = useState(false);
    final passwordConfirmVisibility = useState(false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Builder(
        builder: (context) {
          if (isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              ListTile(
                title: const Text('Email'),
                subtitle: TextField(
                  controller: emailController,
                ),
              ),
              ListTile(
                title: const Text('Name'),
                subtitle: TextField(
                  controller: nameController,
                ),
              ),
              ListTile(
                title: const Text('Password'),
                subtitle: TextField(
                  controller: passwordController,
                  obscureText: !passwordVisibility.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () =>
                          passwordVisibility.value = !passwordVisibility.value,
                      icon: !passwordVisibility.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text('PasswordConfirm'),
                subtitle: TextField(
                  controller: passwordConfirmController,
                  obscureText: !passwordConfirmVisibility.value,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => passwordConfirmVisibility.value =
                          !passwordConfirmVisibility.value,
                      icon: !passwordConfirmVisibility.value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FilledButton(
                    onPressed: onRegister,
                    child: const Text('Register'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
