// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_products_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredProductsControllerHash() =>
    r'8fce9ef865ccfb1d1895119a8b8e1efd470ed57a';

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

abstract class _$FilteredProductsController
    extends BuildlessAutoDisposeAsyncNotifier<List<Product>> {
  late final String query;

  FutureOr<List<Product>> build(
    String query,
  );
}

/// See also [FilteredProductsController].
@ProviderFor(FilteredProductsController)
const filteredProductsControllerProvider = FilteredProductsControllerFamily();

/// See also [FilteredProductsController].
class FilteredProductsControllerFamily
    extends Family<AsyncValue<List<Product>>> {
  /// See also [FilteredProductsController].
  const FilteredProductsControllerFamily();

  /// See also [FilteredProductsController].
  FilteredProductsControllerProvider call(
    String query,
  ) {
    return FilteredProductsControllerProvider(
      query,
    );
  }

  @override
  FilteredProductsControllerProvider getProviderOverride(
    covariant FilteredProductsControllerProvider provider,
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
  String? get name => r'filteredProductsControllerProvider';
}

/// See also [FilteredProductsController].
class FilteredProductsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FilteredProductsController,
        List<Product>> {
  /// See also [FilteredProductsController].
  FilteredProductsControllerProvider(
    String query,
  ) : this._internal(
          () => FilteredProductsController()..query = query,
          from: filteredProductsControllerProvider,
          name: r'filteredProductsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredProductsControllerHash,
          dependencies: FilteredProductsControllerFamily._dependencies,
          allTransitiveDependencies:
              FilteredProductsControllerFamily._allTransitiveDependencies,
          query: query,
        );

  FilteredProductsControllerProvider._internal(
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
  FutureOr<List<Product>> runNotifierBuild(
    covariant FilteredProductsController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(FilteredProductsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredProductsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FilteredProductsController,
      List<Product>> createElement() {
    return _FilteredProductsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredProductsControllerProvider && other.query == query;
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
mixin FilteredProductsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Product>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FilteredProductsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FilteredProductsController,
        List<Product>> with FilteredProductsControllerRef {
  _FilteredProductsControllerProviderElement(super.provider);

  @override
  String get query => (origin as FilteredProductsControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
