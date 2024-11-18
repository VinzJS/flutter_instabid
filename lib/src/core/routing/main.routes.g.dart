

part of 'main.routes.dart';


List<RouteBase> get $appRoutes => [
      $notFoundRoute,
      $splashPageRoute,
      $homePageRoute,
      $rootRouteData,
      $loginPageRoute,
      $accountPageRoute,
      $publicProductsPageRoute,
      $publicProductPageRoute,
      $publicProductSearchPageRoute,
      $publicTagProductsPageRoute,
      $storeProductSelectPageRoute,
      $storeProductCreatePageRoute,
      $storeProductUpdatePageRoute,
      $settingsPageRoute,
      $domainPageRoute,
      $publicBidsPageRoute,
      $publicBidPageRoute,
      $bidCreatePageRoute,
      $storeBidsSelectPageRoute,
      $storeBidPageRoute,
      $publicOrdersPageRoute,
      $publicOrderPageRoute,
      $orderCreatePageRoute,
      $storeOrdersPageRoute,
      $storeOrderPageRoute,
      $publicStorePageRoute,
      $storeSelectPageRoute,
      $storeDashboardPageRoute,
      $storeCreatePageRoute,
      $storeUpdatePageRoute,
      $storeCategoryProductsPageRoute,
      $userUpdatePageRoute,
    ];

RouteBase get $notFoundRoute => GoRouteData.$route(
      path: '/not-found',
      factory: $NotFoundRouteExtension._fromState,
    );

extension $NotFoundRouteExtension on NotFoundRoute {
  static NotFoundRoute _fromState(GoRouterState state) => const NotFoundRoute();

  String get location => GoRouteData.$location(
        '/not-found',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashPageRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashPageRouteExtension._fromState,
    );

extension $SplashPageRouteExtension on SplashPageRoute {
  static SplashPageRoute _fromState(GoRouterState state) =>
      const SplashPageRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homePageRoute => GoRouteData.$route(
      path: '/',
      factory: $HomePageRouteExtension._fromState,
    );

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $rootRouteData => StatefulShellRouteData.$route(
      parentNavigatorKey: RootRouteData.$parentNavigatorKey,
      restorationScopeId: RootRouteData.$restorationScopeId,
      factory: $RootRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/products',
              factory: $PublicProductsPageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/bids',
              factory: $PublicBidsPageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/orders',
              factory: $PublicOrdersPageRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/settings',
              factory: $SettingsPageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $RootRouteDataExtension on RootRouteData {
  static RootRouteData _fromState(GoRouterState state) => const RootRouteData();
}

extension $PublicProductsPageRouteExtension on PublicProductsPageRoute {
  static PublicProductsPageRoute _fromState(GoRouterState state) =>
      const PublicProductsPageRoute();

  String get location => GoRouteData.$location(
        '/products',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PublicBidsPageRouteExtension on PublicBidsPageRoute {
  static PublicBidsPageRoute _fromState(GoRouterState state) =>
      const PublicBidsPageRoute();

  String get location => GoRouteData.$location(
        '/bids',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PublicOrdersPageRouteExtension on PublicOrdersPageRoute {
  static PublicOrdersPageRoute _fromState(GoRouterState state) =>
      const PublicOrdersPageRoute();

  String get location => GoRouteData.$location(
        '/orders',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsPageRouteExtension on SettingsPageRoute {
  static SettingsPageRoute _fromState(GoRouterState state) =>
      const SettingsPageRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginPageRoute => GoRouteData.$route(
      path: '/authentication',
      factory: $LoginPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'recovery',
          factory: $AccountRecoveryPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'registration',
          factory: $RegistrationPageRouteExtension._fromState,
        ),
      ],
    );

extension $LoginPageRouteExtension on LoginPageRoute {
  static LoginPageRoute _fromState(GoRouterState state) =>
      const LoginPageRoute();

  String get location => GoRouteData.$location(
        '/authentication',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRecoveryPageRouteExtension on AccountRecoveryPageRoute {
  static AccountRecoveryPageRoute _fromState(GoRouterState state) =>
      const AccountRecoveryPageRoute();

  String get location => GoRouteData.$location(
        '/authentication/recovery',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegistrationPageRouteExtension on RegistrationPageRoute {
  static RegistrationPageRoute _fromState(GoRouterState state) =>
      const RegistrationPageRoute();

  String get location => GoRouteData.$location(
        '/authentication/registration',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $accountPageRoute => GoRouteData.$route(
      path: '/account',
      factory: $AccountPageRouteExtension._fromState,
    );

extension $AccountPageRouteExtension on AccountPageRoute {
  static AccountPageRoute _fromState(GoRouterState state) =>
      const AccountPageRoute();

  String get location => GoRouteData.$location(
        '/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $publicProductsPageRoute => GoRouteData.$route(
      path: '/products',
      factory: $PublicProductsPageRouteExtension._fromState,
    );

RouteBase get $publicProductPageRoute => GoRouteData.$route(
      path: '/product/:id',
      factory: $PublicProductPageRouteExtension._fromState,
    );

extension $PublicProductPageRouteExtension on PublicProductPageRoute {
  static PublicProductPageRoute _fromState(GoRouterState state) =>
      PublicProductPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/product/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $publicProductSearchPageRoute => GoRouteData.$route(
      path: '/products/search',
      factory: $PublicProductSearchPageRouteExtension._fromState,
    );

extension $PublicProductSearchPageRouteExtension
    on PublicProductSearchPageRoute {
  static PublicProductSearchPageRoute _fromState(GoRouterState state) =>
      const PublicProductSearchPageRoute();

  String get location => GoRouteData.$location(
        '/products/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $publicTagProductsPageRoute => GoRouteData.$route(
      path: '/products/tag/:tagId',
      factory: $PublicTagProductsPageRouteExtension._fromState,
    );

extension $PublicTagProductsPageRouteExtension on PublicTagProductsPageRoute {
  static PublicTagProductsPageRoute _fromState(GoRouterState state) =>
      PublicTagProductsPageRoute(
        state.pathParameters['tagId']!,
      );

  String get location => GoRouteData.$location(
        '/products/tag/${Uri.encodeComponent(tagId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeProductSelectPageRoute => GoRouteData.$route(
      path: '/products/store/:id/select',
      factory: $StoreProductSelectPageRouteExtension._fromState,
    );

extension $StoreProductSelectPageRouteExtension on StoreProductSelectPageRoute {
  static StoreProductSelectPageRoute _fromState(GoRouterState state) =>
      StoreProductSelectPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/products/store/${Uri.encodeComponent(id)}/select',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeProductCreatePageRoute => GoRouteData.$route(
      path: '/products/store/:id/create',
      factory: $StoreProductCreatePageRouteExtension._fromState,
    );

extension $StoreProductCreatePageRouteExtension on StoreProductCreatePageRoute {
  static StoreProductCreatePageRoute _fromState(GoRouterState state) =>
      StoreProductCreatePageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/products/store/${Uri.encodeComponent(id)}/create',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeProductUpdatePageRoute => GoRouteData.$route(
      path: '/products/:id/store/update',
      factory: $StoreProductUpdatePageRouteExtension._fromState,
    );

extension $StoreProductUpdatePageRouteExtension on StoreProductUpdatePageRoute {
  static StoreProductUpdatePageRoute _fromState(GoRouterState state) =>
      StoreProductUpdatePageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/products/${Uri.encodeComponent(id)}/store/update',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsPageRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsPageRouteExtension._fromState,
    );

RouteBase get $domainPageRoute => GoRouteData.$route(
      path: '/domain',
      factory: $DomainPageRouteExtension._fromState,
    );

extension $DomainPageRouteExtension on DomainPageRoute {
  static DomainPageRoute _fromState(GoRouterState state) =>
      const DomainPageRoute();

  String get location => GoRouteData.$location(
        '/domain',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $publicBidsPageRoute => GoRouteData.$route(
      path: '/bids',
      factory: $PublicBidsPageRouteExtension._fromState,
    );

RouteBase get $publicBidPageRoute => GoRouteData.$route(
      path: '/bids/:id',
      factory: $PublicBidPageRouteExtension._fromState,
    );

extension $PublicBidPageRouteExtension on PublicBidPageRoute {
  static PublicBidPageRoute _fromState(GoRouterState state) =>
      PublicBidPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/bids/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $bidCreatePageRoute => GoRouteData.$route(
      path: '/bid/:id/create',
      factory: $BidCreatePageRouteExtension._fromState,
    );

extension $BidCreatePageRouteExtension on BidCreatePageRoute {
  static BidCreatePageRoute _fromState(GoRouterState state) =>
      BidCreatePageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/bid/${Uri.encodeComponent(id)}/create',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeBidsSelectPageRoute => GoRouteData.$route(
      path: '/bid/:id/select',
      factory: $StoreBidsSelectPageRouteExtension._fromState,
    );

extension $StoreBidsSelectPageRouteExtension on StoreBidsSelectPageRoute {
  static StoreBidsSelectPageRoute _fromState(GoRouterState state) =>
      StoreBidsSelectPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/bid/${Uri.encodeComponent(id)}/select',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeBidPageRoute => GoRouteData.$route(
      path: '/bid/store/:id/details',
      factory: $StoreBidPageRouteExtension._fromState,
    );

extension $StoreBidPageRouteExtension on StoreBidPageRoute {
  static StoreBidPageRoute _fromState(GoRouterState state) => StoreBidPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/bid/store/${Uri.encodeComponent(id)}/details',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $publicOrdersPageRoute => GoRouteData.$route(
      path: '/orders',
      factory: $PublicOrdersPageRouteExtension._fromState,
    );

RouteBase get $publicOrderPageRoute => GoRouteData.$route(
      path: '/order/:id',
      factory: $PublicOrderPageRouteExtension._fromState,
    );

extension $PublicOrderPageRouteExtension on PublicOrderPageRoute {
  static PublicOrderPageRoute _fromState(GoRouterState state) =>
      PublicOrderPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/order/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $orderCreatePageRoute => GoRouteData.$route(
      path: '/order/create/:productId',
      factory: $OrderCreatePageRouteExtension._fromState,
    );

extension $OrderCreatePageRouteExtension on OrderCreatePageRoute {
  static OrderCreatePageRoute _fromState(GoRouterState state) =>
      OrderCreatePageRoute(
        state.pathParameters['productId']!,
      );

  String get location => GoRouteData.$location(
        '/order/create/${Uri.encodeComponent(productId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeOrdersPageRoute => GoRouteData.$route(
      path: '/order/store/:id',
      factory: $StoreOrdersPageRouteExtension._fromState,
    );

extension $StoreOrdersPageRouteExtension on StoreOrdersPageRoute {
  static StoreOrdersPageRoute _fromState(GoRouterState state) =>
      StoreOrdersPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/order/store/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeOrderPageRoute => GoRouteData.$route(
      path: '/order/store/details/:id',
      factory: $StoreOrderPageRouteExtension._fromState,
    );

extension $StoreOrderPageRouteExtension on StoreOrderPageRoute {
  static StoreOrderPageRoute _fromState(GoRouterState state) =>
      StoreOrderPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/order/store/details/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $publicStorePageRoute => GoRouteData.$route(
      path: '/store/:id',
      factory: $PublicStorePageRouteExtension._fromState,
    );

extension $PublicStorePageRouteExtension on PublicStorePageRoute {
  static PublicStorePageRoute _fromState(GoRouterState state) =>
      PublicStorePageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/store/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeSelectPageRoute => GoRouteData.$route(
      path: '/stores/select',
      factory: $StoreSelectPageRouteExtension._fromState,
    );

extension $StoreSelectPageRouteExtension on StoreSelectPageRoute {
  static StoreSelectPageRoute _fromState(GoRouterState state) =>
      const StoreSelectPageRoute();

  String get location => GoRouteData.$location(
        '/stores/select',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeDashboardPageRoute => GoRouteData.$route(
      path: '/store/:id/dashboard',
      factory: $StoreDashboardPageRouteExtension._fromState,
    );

extension $StoreDashboardPageRouteExtension on StoreDashboardPageRoute {
  static StoreDashboardPageRoute _fromState(GoRouterState state) =>
      StoreDashboardPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/store/${Uri.encodeComponent(id)}/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeCreatePageRoute => GoRouteData.$route(
      path: '/store-create',
      factory: $StoreCreatePageRouteExtension._fromState,
    );

extension $StoreCreatePageRouteExtension on StoreCreatePageRoute {
  static StoreCreatePageRoute _fromState(GoRouterState state) =>
      const StoreCreatePageRoute();

  String get location => GoRouteData.$location(
        '/store-create',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeUpdatePageRoute => GoRouteData.$route(
      path: '/store/:id/update',
      factory: $StoreUpdatePageRouteExtension._fromState,
    );

extension $StoreUpdatePageRouteExtension on StoreUpdatePageRoute {
  static StoreUpdatePageRoute _fromState(GoRouterState state) =>
      StoreUpdatePageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/store/${Uri.encodeComponent(id)}/update',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $storeCategoryProductsPageRoute => GoRouteData.$route(
      path: '/store/category/:id',
      factory: $StoreCategoryProductsPageRouteExtension._fromState,
    );

extension $StoreCategoryProductsPageRouteExtension
    on StoreCategoryProductsPageRoute {
  static StoreCategoryProductsPageRoute _fromState(GoRouterState state) =>
      StoreCategoryProductsPageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/store/category/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userUpdatePageRoute => GoRouteData.$route(
      path: '/user/:id/update',
      factory: $UserUpdatePageRouteExtension._fromState,
    );

extension $UserUpdatePageRouteExtension on UserUpdatePageRoute {
  static UserUpdatePageRoute _fromState(GoRouterState state) =>
      UserUpdatePageRoute(
        state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/user/${Uri.encodeComponent(id)}/update',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
