part of '../main.routes.dart';

///
/// Category
///

@TypedGoRoute<StoreCategoryProductsPageRoute>(path: StoreCategoryProductsPageRoute.path)
class StoreCategoryProductsPageRoute extends GoRouteData {
  const StoreCategoryProductsPageRoute(this.id);
  static const path = '/store/category/:id';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreCategoryProductsPage(id: id);
  }
}
