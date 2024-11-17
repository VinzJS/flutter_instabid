// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productViewControllerHash() =>
    r'89e775934dfa5206f217c7d751589a5d79faef6b';

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

abstract class _$ProductViewController
    extends BuildlessAutoDisposeAsyncNotifier<ProductViewState> {
  late final String id;

  FutureOr<ProductViewState> build(
    String id,
  );
}

/// See also [ProductViewController].
@ProviderFor(ProductViewController)
const productViewControllerProvider = ProductViewControllerFamily();

/// See also [ProductViewController].
class ProductViewControllerFamily extends Family<AsyncValue<ProductViewState>> {
  /// See also [ProductViewController].
  const ProductViewControllerFamily();

  /// See also [ProductViewController].
  ProductViewControllerProvider call(
    String id,
  ) {
    return ProductViewControllerProvider(
      id,
    );
  }

  @override
  ProductViewControllerProvider getProviderOverride(
    covariant ProductViewControllerProvider provider,
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
  String? get name => r'productViewControllerProvider';
}

/// See also [ProductViewController].
class ProductViewControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductViewController,
        ProductViewState> {
  /// See also [ProductViewController].
  ProductViewControllerProvider(
    String id,
  ) : this._internal(
          () => ProductViewController()..id = id,
          from: productViewControllerProvider,
          name: r'productViewControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productViewControllerHash,
          dependencies: ProductViewControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductViewControllerFamily._allTransitiveDependencies,
          id: id,
        );

  ProductViewControllerProvider._internal(
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
  FutureOr<ProductViewState> runNotifierBuild(
    covariant ProductViewController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(ProductViewController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductViewControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ProductViewController,
      ProductViewState> createElement() {
    return _ProductViewControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductViewControllerProvider && other.id == id;
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
mixin ProductViewControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProductViewState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductViewControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductViewController,
        ProductViewState> with ProductViewControllerRef {
  _ProductViewControllerProviderElement(super.provider);

  @override
  String get id => (origin as ProductViewControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
