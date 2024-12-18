// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_update_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderUpdateControllerHash() =>
    r'a142c5eac8e65e04d0d7ff464695b9d51c2dc449';

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

abstract class _$OrderUpdateController
    extends BuildlessAutoDisposeAsyncNotifier<OrderUpdateParams> {
  late final String orderId;

  FutureOr<OrderUpdateParams> build(
    String orderId,
  );
}

/// See also [OrderUpdateController].
@ProviderFor(OrderUpdateController)
const orderUpdateControllerProvider = OrderUpdateControllerFamily();

/// See also [OrderUpdateController].
class OrderUpdateControllerFamily
    extends Family<AsyncValue<OrderUpdateParams>> {
  /// See also [OrderUpdateController].
  const OrderUpdateControllerFamily();

  /// See also [OrderUpdateController].
  OrderUpdateControllerProvider call(
    String orderId,
  ) {
    return OrderUpdateControllerProvider(
      orderId,
    );
  }

  @override
  OrderUpdateControllerProvider getProviderOverride(
    covariant OrderUpdateControllerProvider provider,
  ) {
    return call(
      provider.orderId,
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
  String? get name => r'orderUpdateControllerProvider';
}

/// See also [OrderUpdateController].
class OrderUpdateControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<OrderUpdateController,
        OrderUpdateParams> {
  /// See also [OrderUpdateController].
  OrderUpdateControllerProvider(
    String orderId,
  ) : this._internal(
          () => OrderUpdateController()..orderId = orderId,
          from: orderUpdateControllerProvider,
          name: r'orderUpdateControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderUpdateControllerHash,
          dependencies: OrderUpdateControllerFamily._dependencies,
          allTransitiveDependencies:
              OrderUpdateControllerFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  OrderUpdateControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final String orderId;

  @override
  FutureOr<OrderUpdateParams> runNotifierBuild(
    covariant OrderUpdateController notifier,
  ) {
    return notifier.build(
      orderId,
    );
  }

  @override
  Override overrideWith(OrderUpdateController Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrderUpdateControllerProvider._internal(
        () => create()..orderId = orderId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<OrderUpdateController,
      OrderUpdateParams> createElement() {
    return _OrderUpdateControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderUpdateControllerProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OrderUpdateControllerRef
    on AutoDisposeAsyncNotifierProviderRef<OrderUpdateParams> {
  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _OrderUpdateControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<OrderUpdateController,
        OrderUpdateParams> with OrderUpdateControllerRef {
  _OrderUpdateControllerProviderElement(super.provider);

  @override
  String get orderId => (origin as OrderUpdateControllerProvider).orderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
