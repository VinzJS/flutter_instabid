import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/core/assets/_index.dart';
import 'package:instabid/src/features/_index.dart';
import 'package:instabid/src/core/routing/main.routes.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    goToRootPage() {
      Future.delayed(const Duration(seconds: 3), () {
        if (context.mounted) const HomePageRoute().go(context);
      });
    }

    ///
    /// redirect to home
    ///
    useEffect(() {
      goToRootPage();
      return null;
    }, []);

    ref.listen(authControllerProvider, (previous, current) {
      goToRootPage();
    });

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 250,
          height: 250,
          child: Assets.icons.appIconTransparent.image(),
        ),
      ),
    );
  }
}
