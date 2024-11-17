part of '../main.routes.dart';

///
/// Bids
///

class PublicBidsBranchData extends StatefulShellBranchData {
  const PublicBidsBranchData();
}

@TypedGoRoute<PublicBidsPageRoute>(path: PublicBidsPageRoute.path)
class PublicBidsPageRoute extends GoRouteData {
  const PublicBidsPageRoute();
  static const path = '/bids';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PublicBidsPage();
  }
}

@TypedGoRoute<PublicBidPageRoute>(path: PublicBidPageRoute.path)
class PublicBidPageRoute extends GoRouteData {
  const PublicBidPageRoute(this.id);
  static const path = '/bids/:id';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PublicBidPage(id: id);
  }
}

@TypedGoRoute<BidCreatePageRoute>(path: BidCreatePageRoute.path)
class BidCreatePageRoute extends GoRouteData {
  const BidCreatePageRoute(this.id);
  static const path = '/bid/:id/create';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BidCreatePage(id: id);
  }
}


@TypedGoRoute<StoreBidsSelectPageRoute>(path: StoreBidsSelectPageRoute.path)
class StoreBidsSelectPageRoute extends GoRouteData {
  const StoreBidsSelectPageRoute(this.id);
  static const path = '/bid/:id/select';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreBidsSelectPage(id: id);
  }
}


@TypedGoRoute<StoreBidPageRoute>(path: StoreBidPageRoute.path)
class StoreBidPageRoute extends GoRouteData {
  const StoreBidPageRoute(this.id);
  static const path = '/bid/store/:id/details';

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StoreBidPage(id: id);
  }
}