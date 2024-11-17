// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storeControllerHash() => r'82a4e101be279d008a9dabd4f339c00a8855eac1';

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

abstract class _$StoreController
    extends BuildlessAutoDisposeAsyncNotifier<StoreFront> {
  late final String id;

  FutureOr<StoreFront> build(
    String id,
  );
}

/// See also [StoreController].
@ProviderFor(StoreController)
const storeControllerProvider = StoreControllerFamily();

/// See also [StoreController].
class StoreControllerFamily extends Family<AsyncValue<StoreFront>> {
  /// See also [StoreController].
  const StoreControllerFamily();

  /// See also [StoreController].
  StoreControllerProvider call(
    String id,
  ) {
    return StoreControllerProvider(
      id,
    );
  }

  @override
  StoreControllerProvider getProviderOverride(
    covariant StoreControllerProvider provider,
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
  String? get name => r'storeControllerProvider';
}

/// See also [StoreController].
class StoreControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<StoreController, StoreFront> {
  /// See also [StoreController].
  StoreControllerProvider(
    String id,
  ) : this._internal(
          () => StoreController()..id = id,
          from: storeControllerProvider,
          name: r'storeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$storeControllerHash,
          dependencies: StoreControllerFamily._dependencies,
          allTransitiveDependencies:
              StoreControllerFamily._allTransitiveDependencies,
          id: id,
        );

  StoreControllerProvider._internal(
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
  FutureOr<StoreFront> runNotifierBuild(
    covariant StoreController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(StoreController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StoreControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<StoreController, StoreFront>
      createElement() {
    return _StoreControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StoreControllerProvider && other.id == id;
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
mixin StoreControllerRef on AutoDisposeAsyncNotifierProviderRef<StoreFront> {
  /// The parameter `id` of this provider.
  String get id;
}

class _StoreControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StoreController, StoreFront>
    with StoreControllerRef {
  _StoreControllerProviderElement(super.provider);

  @override
  String get id => (origin as StoreControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
