// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_stores_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredStoresControllerHash() =>
    r'dd434e4c98b34e38a5720cd49c1c2f7d98bbf1ea';

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

abstract class _$FilteredStoresController
    extends BuildlessAutoDisposeAsyncNotifier<List<StoreFront>> {
  late final String query;

  FutureOr<List<StoreFront>> build(
    String query,
  );
}

/// See also [FilteredStoresController].
@ProviderFor(FilteredStoresController)
const filteredStoresControllerProvider = FilteredStoresControllerFamily();

/// See also [FilteredStoresController].
class FilteredStoresControllerFamily
    extends Family<AsyncValue<List<StoreFront>>> {
  /// See also [FilteredStoresController].
  const FilteredStoresControllerFamily();

  /// See also [FilteredStoresController].
  FilteredStoresControllerProvider call(
    String query,
  ) {
    return FilteredStoresControllerProvider(
      query,
    );
  }

  @override
  FilteredStoresControllerProvider getProviderOverride(
    covariant FilteredStoresControllerProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'filteredStoresControllerProvider';
}

/// See also [FilteredStoresController].
class FilteredStoresControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FilteredStoresController,
        List<StoreFront>> {
  /// See also [FilteredStoresController].
  FilteredStoresControllerProvider(
    String query,
  ) : this._internal(
          () => FilteredStoresController()..query = query,
          from: filteredStoresControllerProvider,
          name: r'filteredStoresControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredStoresControllerHash,
          dependencies: FilteredStoresControllerFamily._dependencies,
          allTransitiveDependencies:
              FilteredStoresControllerFamily._allTransitiveDependencies,
          query: query,
        );

  FilteredStoresControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<List<StoreFront>> runNotifierBuild(
    covariant FilteredStoresController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(FilteredStoresController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredStoresControllerProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FilteredStoresController,
      List<StoreFront>> createElement() {
    return _FilteredStoresControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredStoresControllerProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredStoresControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<StoreFront>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FilteredStoresControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FilteredStoresController,
        List<StoreFront>> with FilteredStoresControllerRef {
  _FilteredStoresControllerProviderElement(super.provider);

  @override
  String get query => (origin as FilteredStoresControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
