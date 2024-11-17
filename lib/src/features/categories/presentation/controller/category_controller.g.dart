// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryControllerHash() =>
    r'2daf3088e066145f76f09a5f2134bdf2b691375e';

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

abstract class _$CategoryController
    extends BuildlessAutoDisposeAsyncNotifier<Category> {
  late final String id;

  FutureOr<Category> build(
    String id,
  );
}

/// See also [CategoryController].
@ProviderFor(CategoryController)
const categoryControllerProvider = CategoryControllerFamily();

/// See also [CategoryController].
class CategoryControllerFamily extends Family<AsyncValue<Category>> {
  /// See also [CategoryController].
  const CategoryControllerFamily();

  /// See also [CategoryController].
  CategoryControllerProvider call(
    String id,
  ) {
    return CategoryControllerProvider(
      id,
    );
  }

  @override
  CategoryControllerProvider getProviderOverride(
    covariant CategoryControllerProvider provider,
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
  String? get name => r'categoryControllerProvider';
}

/// See also [CategoryController].
class CategoryControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CategoryController, Category> {
  /// See also [CategoryController].
  CategoryControllerProvider(
    String id,
  ) : this._internal(
          () => CategoryController()..id = id,
          from: categoryControllerProvider,
          name: r'categoryControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryControllerHash,
          dependencies: CategoryControllerFamily._dependencies,
          allTransitiveDependencies:
              CategoryControllerFamily._allTransitiveDependencies,
          id: id,
        );

  CategoryControllerProvider._internal(
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
  FutureOr<Category> runNotifierBuild(
    covariant CategoryController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(CategoryController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CategoryController, Category>
      createElement() {
    return _CategoryControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryControllerProvider && other.id == id;
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
mixin CategoryControllerRef on AutoDisposeAsyncNotifierProviderRef<Category> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CategoryControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryController,
        Category> with CategoryControllerRef {
  _CategoryControllerProviderElement(super.provider);

  @override
  String get id => (origin as CategoryControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
