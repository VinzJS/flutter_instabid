import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:instabid/src/_index.dart';

part 'main.routes.g.dart';
part 'routes/authentication.routes.dart';
part 'routes/products.routes.dart';
part 'routes/settings.routes.dart';
part 'routes/bids.routes.dart';
part 'routes/orders.routes.dart';
part 'routes/store.routes.dart';
part 'routes/category.routes.dart';
part 'routes/user.routes.dart';

///
/// Just the same ussage for the basic go router but with generated routes so no need to recreate routes every time
/// 
/// taken from this same with setup for bottom nav bar
/// https://medium.com/@zahidulislam.pubalibank/go-router-an-efficient-way-to-manage-flutter-navigation-development-process-8a4c03e69066
/// 
///

typedef TypeRouteData = TypedRoute<RouteData>;

typedef RootRoute = HomePageRoute;

final rootKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@TypedGoRoute<NotFoundRoute>(path: NotFoundRoute.path)
class NotFoundRoute extends GoRouteData {
  const NotFoundRoute();
  static const path = '/not-found';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotFoundPage();
  }
}

@TypedGoRoute<SplashPageRoute>(path: SplashPageRoute.path)
class SplashPageRoute extends GoRouteData {
  const SplashPageRoute();
  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<HomePageRoute>(path: HomePageRoute.path)
class HomePageRoute extends GoRouteData {
  const HomePageRoute();
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    return PublicProductsPageRoute.path;
  }
}

@TypedStatefulShellRoute<RootRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    ///
    /// products
    ///
    TypedStatefulShellBranch<PublicProductsBranchData>(
      routes: <TypeRouteData>[
        // home
        TypedGoRoute<PublicProductsPageRoute>(
            path: PublicProductsPageRoute.path),
      ],
    ),

    ///
    /// Bids
    ///
    TypedStatefulShellBranch<PublicBidsBranchData>(
      routes: <TypeRouteData>[
        // home
        TypedGoRoute<PublicBidsPageRoute>(path: PublicBidsPageRoute.path),
      ],
    ),

    ///
    /// Orders
    ///
    TypedStatefulShellBranch<PublicOrdersBranchData>(
      routes: <TypeRouteData>[
        // home
        TypedGoRoute<PublicOrdersPageRoute>(path: PublicOrdersPageRoute.path),
      ],
    ),

    ///
    /// Account
    ///
    TypedStatefulShellBranch<SettingsBranchData>(
      routes: <TypeRouteData>[
        // home
        TypedGoRoute<SettingsPageRoute>(path: SettingsPageRoute.path),
      ],
    ),
  ],
)
class RootRouteData extends StatefulShellRouteData {
  const RootRouteData();

  static const String $restorationScopeId = 'restorationScopeId';

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AppRoot(shell: navigationShell, state: state);
  }
}
