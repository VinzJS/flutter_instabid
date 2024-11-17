import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    ///
    ///
    onLogout() async {
      final result =
          await ref.read(authControllerProvider.notifier).logout().run();
      result.fold(
        (l) => AppSnackBar.rootError(message: l.toString()),
        (r) => const LoginPageRoute().go(context),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        children: [
          ///
          /// User Profile
          ///
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 205,
            ),
            child: AuthBuilder(
              builder: (user) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (user.hasPicture)
                      ImageViewer(
                        id: user.id,
                        feature: 'users',
                        file: user.profilePhoto ?? '',
                        builder: (url) => ClipOval(
                          child: CircleAvatar(
                            maxRadius: 60,
                            minRadius: 50,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                              url,
                            ),
                            child: null,
                          ),
                        ),
                      ),
                    SizedBox(height: 20),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(user.name),
                  ],
                );
              },
            ),
          ),

          ///
          ///
          ///
          // ListTile(
          //   title: const Text('Server URL'),
          //   onTap: () => const DomainPageRoute().push(context),
          //   trailing: const Icon(Icons.chevron_right),
          // ),
          AuthBuilder(
            builder: (user) {
              return Column(
                children: [
                  ListTile(
                    title: const Text('Update Your Profile'),
                    onTap: () => UserUpdatePageRoute(user.id).push(context),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  if (user.isStoreOwner) const Divider(),
                  if (user.isStoreOwner)
                    ListTile(
                      selected: true,
                      leading: Icon(MIcons.storeOutline),
                      title: const Text('Your Stores'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => const StoreSelectPageRoute().push(context),
                    ),
                ],
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: onLogout,
          )
        ],
      ),
    );
  }
}
