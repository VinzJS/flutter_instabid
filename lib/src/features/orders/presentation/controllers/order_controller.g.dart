// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderControllerHash() => r'd14943a3a7ebc31866a676a723364ace4491f8b5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$OrderController
    extends BuildlessAutoDisposeAsyncNotifier<Order> {
  late final String id;

  FutureOr<Order> build(
    String id,
  );
}

/// See also [OrderController].
@ProviderFor(OrderController)
const orderControllerProvider = OrderControllerFamily();

/// See also [OrderController].
class OrderControllerFamily extends Family<AsyncValue<Order>> {
  /// See also [OrderController].
  const OrderControllerFamily();

  /// See also [OrderController].
  OrderControllerProvider call(
    String id,
  ) {
    return OrderControllerProvider(
      id,
    );
  }

  @override
  OrderControllerProvider getProviderOverride(
    covariant OrderControllerProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'orderControllerProvider';
}

/// See also [OrderController].
class OrderControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<OrderController, Order> {
  /// See also [OrderController].
  OrderControllerProvider(
    String id,
  ) : this._internal(
          () => OrderController()..id = id,
          from: orderControllerProvider,
          name: r'orderControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderControllerHash,
          dependencies: OrderControllerFamily._dependencies,
          allTransitiveDependencies:
              OrderControllerFamily._allTransitiveDependencies,
          id: id,
        );

  OrderControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<Order> runNotifierBuild(
    covariant OrderController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(OrderController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrderControllerProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<OrderController, Order>
      createElement() {
    return _OrderControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OrderControllerRef on AutoDisposeAsyncNotifierProviderRef<Order> {
  /// The parameter `id` of this provider.
  String get id;
}

class _OrderControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<OrderController, Order>
    with OrderControllerRef {
  _OrderControllerProviderElement(super.provider);

  @override
  String get id => (origin as OrderControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
