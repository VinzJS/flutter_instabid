// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_create_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bidCreateControllerHash() =>
    r'9f4accd7951d1e96ea433fe704941d9beb48c1ce';

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

abstract class _$BidCreateController
    extends BuildlessAutoDisposeAsyncNotifier<BidCreateState> {
  late final String productId;

  FutureOr<BidCreateState> build(
    String productId,
  );
}

/// See also [BidCreateController].
@ProviderFor(BidCreateController)
const bidCreateControllerProvider = BidCreateControllerFamily();

/// See also [BidCreateController].
class BidCreateControllerFamily extends Family<AsyncValue<BidCreateState>> {
  /// See also [BidCreateController].
  const BidCreateControllerFamily();

  /// See also [BidCreateController].
  BidCreateControllerProvider call(
    String productId,
  ) {
    return BidCreateControllerProvider(
      productId,
    );
  }

  @override
  BidCreateControllerProvider getProviderOverride(
    covariant BidCreateControllerProvider provider,
  ) {
    return call(
      provider.productId,
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
  String? get name => r'bidCreateControllerProvider';
}

/// See also [BidCreateController].
class BidCreateControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    BidCreateController, BidCreateState> {
  /// See also [BidCreateController].
  BidCreateControllerProvider(
    String productId,
  ) : this._internal(
          () => BidCreateController()..productId = productId,
          from: bidCreateControllerProvider,
          name: r'bidCreateControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bidCreateControllerHash,
          dependencies: BidCreateControllerFamily._dependencies,
          allTransitiveDependencies:
              BidCreateControllerFamily._allTransitiveDependencies,
          productId: productId,
        );

  BidCreateControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  FutureOr<BidCreateState> runNotifierBuild(
    covariant BidCreateController notifier,
  ) {
    return notifier.build(
      productId,
    );
  }

  @override
  Override overrideWith(BidCreateController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BidCreateControllerProvider._internal(
        () => create()..productId = productId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BidCreateController, BidCreateState>
      createElement() {
    return _BidCreateControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BidCreateControllerProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BidCreateControllerRef
    on AutoDisposeAsyncNotifierProviderRef<BidCreateState> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _BidCreateControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BidCreateController,
        BidCreateState> with BidCreateControllerRef {
  _BidCreateControllerProviderElement(super.provider);

  @override
  String get productId => (origin as BidCreateControllerProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
