import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'main.routes.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  ///
  /// ignored routes
  ///
  final ignoredRoutes = <String>[
    LoginPageRoute.path,
    RegistrationPageRoute.path,
    DomainPageRoute.path,
  ];

  final storeOwnerRoutes = <String>[];

  return GoRouter(
    initialLocation: RootRoute.path,
    debugLogDiagnostics: true,
    navigatorKey: rootKey,
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);

      final isAuthenticated = auth.valueOrNull is User;
      final isLoading = auth is AsyncLoading;

      ///
      /// authentication
      ///

      if (isLoading) return SplashPageRoute.path;

      // if fullPath is found in ignoredRoutes
      final results = ignoredRoutes.where(
        (x) => state.fullPath?.contains(x) ?? false,
      );
      if (results.isNotEmpty) return null;

      if (isAuthenticated) return null;

      return LoginPageRoute.path;
    },
    routes: $appRoutes,
    errorBuilder: const NotFoundRoute().build,
  );
}
