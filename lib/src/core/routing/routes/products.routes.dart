part of '../main.routes.dart';

///
/// Products
///

class PublicProductsBranchData extends StatefulShellBranchData {
  const PublicProductsBranchData();
}

@TypedGoRoute<PublicProductsPageRoute>(path: PublicProductsPageRoute.path)
class PublicProductsPageRoute extends GoRouteData {
  const PublicProductsPageRoute();
  static const path = '/products';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PublicProductsPage();
  }
}

@TypedGoRoute<PublicProductPageRoute>(path: PublicProductPageRoute.path)
class PublicProductPageRoute extends GoRouteData {
  const PublicProductPageRoute(this.id);
  static const path = '/product/:id';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PublicProductPage(id: id);
  }
}

@TypedGoRoute<PublicProductSearchPageRoute>(
  path: PublicProductSearchPageRoute.path,
)
class PublicProductSearchPageRoute extends GoRouteData {
  const PublicProductSearchPageRoute();
  static const path = '/products/search';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PublicProductSearchPage();
  }
}

@TypedGoRoute<PublicTagProductsPageRoute>(
  path: PublicTagProductsPageRoute.path,
)
class PublicTagProductsPageRoute extends GoRouteData {
  const PublicTagProductsPageRoute(this.tagId);
  static const path = '/products/tag/:tagId';
  final String tagId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PublicTagProductsPage(tagId: tagId);
  }
}

@TypedGoRoute<StoreProductSelectPageRoute>(
  path: StoreProductSelectPageRoute.path,
)
class StoreProductSelectPageRoute extends GoRouteData {
  const StoreProductSelectPageRoute(this.id);
  static const path = '/products/store/:id/select';
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreProductSelectPage(id: id);
  }
}

@TypedGoRoute<StoreProductCreatePageRoute>(
  path: StoreProductCreatePageRoute.path,
)
class StoreProductCreatePageRoute extends GoRouteData {
  const StoreProductCreatePageRoute(this.id);
  static const path = '/products/store/:id/create';
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreProductCreatePage(id: id);
  }
}

@TypedGoRoute<StoreProductUpdatePageRoute>(
  path: StoreProductUpdatePageRoute.path,
)
class StoreProductUpdatePageRoute extends GoRouteData {
  const StoreProductUpdatePageRoute(this.id);
  static const path = '/products/:id/store/update';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreProductUpdatePage(id: id);
  }
}
