// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_categories_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredCategoriesControllerHash() =>
    r'b593bb3daf02e90d1026b41e568fbc15e3684478';

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

abstract class _$FilteredCategoriesController
    extends BuildlessAutoDisposeAsyncNotifier<List<Category>> {
  late final String filter;

  FutureOr<List<Category>> build(
    String filter,
  );
}

/// See also [FilteredCategoriesController].
@ProviderFor(FilteredCategoriesController)
const filteredCategoriesControllerProvider =
    FilteredCategoriesControllerFamily();

/// See also [FilteredCategoriesController].
class FilteredCategoriesControllerFamily
    extends Family<AsyncValue<List<Category>>> {
  /// See also [FilteredCategoriesController].
  const FilteredCategoriesControllerFamily();

  /// See also [FilteredCategoriesController].
  FilteredCategoriesControllerProvider call(
    String filter,
  ) {
    return FilteredCategoriesControllerProvider(
      filter,
    );
  }

  @override
  FilteredCategoriesControllerProvider getProviderOverride(
    covariant FilteredCategoriesControllerProvider provider,
  ) {
    return call(
      provider.filter,
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
  String? get name => r'filteredCategoriesControllerProvider';
}

/// See also [FilteredCategoriesController].
class FilteredCategoriesControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FilteredCategoriesController,
        List<Category>> {
  /// See also [FilteredCategoriesController].
  FilteredCategoriesControllerProvider(
    String filter,
  ) : this._internal(
          () => FilteredCategoriesController()..filter = filter,
          from: filteredCategoriesControllerProvider,
          name: r'filteredCategoriesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredCategoriesControllerHash,
          dependencies: FilteredCategoriesControllerFamily._dependencies,
          allTransitiveDependencies:
              FilteredCategoriesControllerFamily._allTransitiveDependencies,
          filter: filter,
        );

  FilteredCategoriesControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final String filter;

  @override
  FutureOr<List<Category>> runNotifierBuild(
    covariant FilteredCategoriesController notifier,
  ) {
    return notifier.build(
      filter,
    );
  }

  @override
  Override overrideWith(FilteredCategoriesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredCategoriesControllerProvider._internal(
        () => create()..filter = filter,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FilteredCategoriesController,
      List<Category>> createElement() {
    return _FilteredCategoriesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredCategoriesControllerProvider &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredCategoriesControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Category>> {
  /// The parameter `filter` of this provider.
  String get filter;
}

class _FilteredCategoriesControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        FilteredCategoriesController,
        List<Category>> with FilteredCategoriesControllerRef {
  _FilteredCategoriesControllerProviderElement(super.provider);

  @override
  String get filter => (origin as FilteredCategoriesControllerProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
