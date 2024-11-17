part of '../main.routes.dart';

@TypedGoRoute<PublicStorePageRoute>(path: PublicStorePageRoute.path)
class PublicStorePageRoute extends GoRouteData {
  const PublicStorePageRoute(this.id);
  static const path = '/store/:id';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PublicStorePage(id: id);
  }
}

@TypedGoRoute<StoreSelectPageRoute>(path: StoreSelectPageRoute.path)
class StoreSelectPageRoute extends GoRouteData {
  const StoreSelectPageRoute();
  static const path = '/stores/select';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StoreSelectPage();
  }
}

@TypedGoRoute<StoreDashboardPageRoute>(path: StoreDashboardPageRoute.path)
class StoreDashboardPageRoute extends GoRouteData {
  const StoreDashboardPageRoute(this.id);
  static const path = '/store/:id/dashboard';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreDashboardPage(id: id);
  }
}

@TypedGoRoute<StoreCreatePageRoute>(path: StoreCreatePageRoute.path)
class StoreCreatePageRoute extends GoRouteData {
  const StoreCreatePageRoute();
  static const path = '/store-create';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StoreCreatePage();
  }
}

@TypedGoRoute<StoreUpdatePageRoute>(path: StoreUpdatePageRoute.path)
class StoreUpdatePageRoute extends GoRouteData {
  const StoreUpdatePageRoute(this.id);
  static const path = '/store/:id/update';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreUpdatePage(id: id);
  }
}
