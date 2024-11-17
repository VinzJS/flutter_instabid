// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_filtered_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsFilteredControllerHash() =>
    r'8e74e13aa5fcd5cd72732be0871bc3484d7a21f8';

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

abstract class _$ProductsFilteredController
    extends BuildlessAutoDisposeAsyncNotifier<List<Product>> {
  late final String query;

  FutureOr<List<Product>> build(
    String query,
  );
}

/// See also [ProductsFilteredController].
@ProviderFor(ProductsFilteredController)
const productsFilteredControllerProvider = ProductsFilteredControllerFamily();

/// See also [ProductsFilteredController].
class ProductsFilteredControllerFamily
    extends Family<AsyncValue<List<Product>>> {
  /// See also [ProductsFilteredController].
  const ProductsFilteredControllerFamily();

  /// See also [ProductsFilteredController].
  ProductsFilteredControllerProvider call(
    String query,
  ) {
    return ProductsFilteredControllerProvider(
      query,
    );
  }

  @override
  ProductsFilteredControllerProvider getProviderOverride(
    covariant ProductsFilteredControllerProvider provider,
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
  String? get name => r'productsFilteredControllerProvider';
}

/// See also [ProductsFilteredController].
class ProductsFilteredControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductsFilteredController,
        List<Product>> {
  /// See also [ProductsFilteredController].
  ProductsFilteredControllerProvider(
    String query,
  ) : this._internal(
          () => ProductsFilteredController()..query = query,
          from: productsFilteredControllerProvider,
          name: r'productsFilteredControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsFilteredControllerHash,
          dependencies: ProductsFilteredControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductsFilteredControllerFamily._allTransitiveDependencies,
          query: query,
        );

  ProductsFilteredControllerProvider._internal(
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
    covariant ProductsFilteredController notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(ProductsFilteredController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductsFilteredControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProductsFilteredController,
      List<Product>> createElement() {
    return _ProductsFilteredControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsFilteredControllerProvider && other.query == query;
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
mixin ProductsFilteredControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Product>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _ProductsFilteredControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductsFilteredController,
        List<Product>> with ProductsFilteredControllerRef {
  _ProductsFilteredControllerProviderElement(super.provider);

  @override
  String get query => (origin as ProductsFilteredControllerProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
