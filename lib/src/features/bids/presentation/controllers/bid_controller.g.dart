// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bidControllerHash() => r'ef88cc35c83f615f61e5cdc613dc1da35e374e45';

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

abstract class _$BidController extends BuildlessAutoDisposeAsyncNotifier<Bid> {
  late final String id;

  FutureOr<Bid> build(
    String id,
  );
}

/// See also [BidController].
@ProviderFor(BidController)
const bidControllerProvider = BidControllerFamily();

/// See also [BidController].
class BidControllerFamily extends Family<AsyncValue<Bid>> {
  /// See also [BidController].
  const BidControllerFamily();

  /// See also [BidController].
  BidControllerProvider call(
    String id,
  ) {
    return BidControllerProvider(
      id,
    );
  }

  @override
  BidControllerProvider getProviderOverride(
    covariant BidControllerProvider provider,
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
  String? get name => r'bidControllerProvider';
}

/// See also [BidController].
class BidControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BidController, Bid> {
  /// See also [BidController].
  BidControllerProvider(
    String id,
  ) : this._internal(
          () => BidController()..id = id,
          from: bidControllerProvider,
          name: r'bidControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bidControllerHash,
          dependencies: BidControllerFamily._dependencies,
          allTransitiveDependencies:
              BidControllerFamily._allTransitiveDependencies,
          id: id,
        );

  BidControllerProvider._internal(
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
  FutureOr<Bid> runNotifierBuild(
    covariant BidController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(BidController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BidControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<BidController, Bid> createElement() {
    return _BidControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BidControllerProvider && other.id == id;
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
mixin BidControllerRef on AutoDisposeAsyncNotifierProviderRef<Bid> {
  /// The parameter `id` of this provider.
  String get id;
}

class _BidControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BidController, Bid>
    with BidControllerRef {
  _BidControllerProviderElement(super.provider);

  @override
  String get id => (origin as BidControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
