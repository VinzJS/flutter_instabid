// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bidViewControllerHash() => r'20b3d9cebd4f4a66d1888cd018b457eef9b6b006';

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

abstract class _$BidViewController
    extends BuildlessAutoDisposeAsyncNotifier<BidViewState> {
  late final String id;

  FutureOr<BidViewState> build(
    String id,
  );
}

/// See also [BidViewController].
@ProviderFor(BidViewController)
const bidViewControllerProvider = BidViewControllerFamily();

/// See also [BidViewController].
class BidViewControllerFamily extends Family<AsyncValue<BidViewState>> {
  /// See also [BidViewController].
  const BidViewControllerFamily();

  /// See also [BidViewController].
  BidViewControllerProvider call(
    String id,
  ) {
    return BidViewControllerProvider(
      id,
    );
  }

  @override
  BidViewControllerProvider getProviderOverride(
    covariant BidViewControllerProvider provider,
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
  String? get name => r'bidViewControllerProvider';
}

/// See also [BidViewController].
class BidViewControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    BidViewController, BidViewState> {
  /// See also [BidViewController].
  BidViewControllerProvider(
    String id,
  ) : this._internal(
          () => BidViewController()..id = id,
          from: bidViewControllerProvider,
          name: r'bidViewControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bidViewControllerHash,
          dependencies: BidViewControllerFamily._dependencies,
          allTransitiveDependencies:
              BidViewControllerFamily._allTransitiveDependencies,
          id: id,
        );

  BidViewControllerProvider._internal(
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
  FutureOr<BidViewState> runNotifierBuild(
    covariant BidViewController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(BidViewController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BidViewControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<BidViewController, BidViewState>
      createElement() {
    return _BidViewControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BidViewControllerProvider && other.id == id;
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
mixin BidViewControllerRef
    on AutoDisposeAsyncNotifierProviderRef<BidViewState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _BidViewControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BidViewController,
        BidViewState> with BidViewControllerRef {
  _BidViewControllerProviderElement(super.provider);

  @override
  String get id => (origin as BidViewControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package