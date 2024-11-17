// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productControllerHash() => r'a6fe37eebdde7d1aa82baae2a2b4aa4e57223d46';

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

abstract class _$ProductController
    extends BuildlessAutoDisposeAsyncNotifier<Product> {
  late final String id;

  FutureOr<Product> build(
    String id,
  );
}

/// See also [ProductController].
@ProviderFor(ProductController)
const productControllerProvider = ProductControllerFamily();

/// See also [ProductController].
class ProductControllerFamily extends Family<AsyncValue<Product>> {
  /// See also [ProductController].
  const ProductControllerFamily();

  /// See also [ProductController].
  ProductControllerProvider call(
    String id,
  ) {
    return ProductControllerProvider(
      id,
    );
  }

  @override
  ProductControllerProvider getProviderOverride(
    covariant ProductControllerProvider provider,
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
  String? get name => r'productControllerProvider';
}

/// See also [ProductController].
class ProductControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductController, Product> {
  /// See also [ProductController].
  ProductControllerProvider(
    String id,
  ) : this._internal(
          () => ProductController()..id = id,
          from: productControllerProvider,
          name: r'productControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productControllerHash,
          dependencies: ProductControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductControllerFamily._allTransitiveDependencies,
          id: id,
        );

  ProductControllerProvider._internal(
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
  FutureOr<Product> runNotifierBuild(
    covariant ProductController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ProductController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProductController, Product>
      createElement() {
    return _ProductControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductControllerProvider && other.id == id;
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
mixin ProductControllerRef on AutoDisposeAsyncNotifierProviderRef<Product> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductController, Product>
    with ProductControllerRef {
  _ProductControllerProviderElement(super.provider);

  @override
  String get id => (origin as ProductControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package