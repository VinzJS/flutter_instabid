import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///
    /// Logout
    ///
    void onLogout() {
      ref.read(authControllerProvider.notifier).logout().run();
    }

    ///
    /// Refresh
    ///
    Future<void> onRefresh() async {
      await ref.read(authControllerProvider.notifier).refresh().run();
    }

    ///
    /// Navigate to account update page
    ///
    void onAccountUpdate(User user) async {
      final result = await UserUpdatePageRoute(user.id).push(context);
      if (result is User) {
        ref.invalidate(authControllerProvider);
        AppSnackBar.root(message: 'updated success');
      }
    }

    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: CustomScrollView(
          slivers: [
            authState.when(
                skipError: false,
                skipLoadingOnRefresh: false,
                skipLoadingOnReload: false,
                data: (user) {
                  return SliverList.list(
                    children: [
                      ImageViewer(
                        id: user.id,
                        feature: 'users',
                        file: user.profilePhoto ?? '',
                        builder: (url) => CircleAvatar(
                          child: CachedNetworkImage(
                              height: 120,
                              width: 120,
                              imageUrl: url,
                              fit: BoxFit.fitWidth,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                        ),
                      ),

                      ///
                      /// user info
                      ///
                      ListTile(
                        title: const Text('Name'),
                        subtitle: Text(user.name),
                      ),

                      ListTile(
                        title: const Text('Email'),
                        subtitle: Text(user.email),
                      ),

                      ListTile(
                        title: const Text('Is a Store Owner'),
                        subtitle: Text(user.isStoreOwner ? 'Yes' : 'No'),
                      ),

                      ListTile(
                        title: const Text('Date Joined'),
                        // subtitle: Text(user.created.toLocal().toString()),
                      ),

                      ListTile(
                        title: const Text('Date Updated'),
                        // subtitle: Text(user.updated.toLocal().toString()),
                      ),

                      ///
                      /// Edit Account
                      ///
                      ListTile(
                        leading: Icon(MIcons.accountEditOutline),
                        title: const Text('Account Edit'),
                        onTap: () => onAccountUpdate(user),
                      ),

                      ///
                      /// logout
                      ///
                      ListTile(
                        leading: Icon(
                          MIcons.logout,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        title: const Text('Logout'),
                        onTap: onLogout,
                      ),
                    ],
                  );
                },
                error: (error, stack) => SliverFillRemaining(
                      child: Center(
                        child: Text(error.toString()),
                      ),
                    ),
                loading: () {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
