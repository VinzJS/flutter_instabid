part of '../main.routes.dart';

///
/// Orders
///

class PublicOrdersBranchData extends StatefulShellBranchData {
  const PublicOrdersBranchData();
}

@TypedGoRoute<PublicOrdersPageRoute>(path: PublicOrdersPageRoute.path)
class PublicOrdersPageRoute extends GoRouteData {
  const PublicOrdersPageRoute();
  static const path = '/orders';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PublicOrdersPage();
  }
}

@TypedGoRoute<PublicOrderPageRoute>(path: PublicOrderPageRoute.path)
class PublicOrderPageRoute extends GoRouteData {
  const PublicOrderPageRoute(this.id);
  static const path = '/order/:id';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PublicOrderPage(id: id);
  }
}

@TypedGoRoute<OrderCreatePageRoute>(path: OrderCreatePageRoute.path)
class OrderCreatePageRoute extends GoRouteData {
  const OrderCreatePageRoute(this.productId);
  static const path = '/order/create/:productId';

  final String productId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OrderCreatePage(productId: productId);
  }
}

@TypedGoRoute<StoreOrdersPageRoute>(path: StoreOrdersPageRoute.path)
class StoreOrdersPageRoute extends GoRouteData {
  const StoreOrdersPageRoute(this.id);
  static const path = '/order/store/:id';

  /// the store id
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreOrdersPage(id: id);
  }
}

@TypedGoRoute<StoreOrderPageRoute>(path: StoreOrderPageRoute.path)
class StoreOrderPageRoute extends GoRouteData {
  const StoreOrderPageRoute(this.id);
  static const path = '/order/store/details/:id';

  /// the store id
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreOrderPage(id: id);
  }
}
