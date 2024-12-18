// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_orders_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredOrdersControllerHash() =>
    r'4da1c423c125b4d49d75917ae8ae5b36e10095e1';

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

abstract class _$FilteredOrdersController
    extends BuildlessAutoDisposeAsyncNotifier<List<Order>> {
  late final String filter;

  FutureOr<List<Order>> build(
    String filter,
  );
}

/// See also [FilteredOrdersController].
@ProviderFor(FilteredOrdersController)
const filteredOrdersControllerProvider = FilteredOrdersControllerFamily();

/// See also [FilteredOrdersController].
class FilteredOrdersControllerFamily extends Family<AsyncValue<List<Order>>> {
  /// See also [FilteredOrdersController].
  const FilteredOrdersControllerFamily();

  /// See also [FilteredOrdersController].
  FilteredOrdersControllerProvider call(
    String filter,
  ) {
    return FilteredOrdersControllerProvider(
      filter,
    );
  }

  @override
  FilteredOrdersControllerProvider getProviderOverride(
    covariant FilteredOrdersControllerProvider provider,
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
  String? get name => r'filteredOrdersControllerProvider';
}

/// See also [FilteredOrdersController].
class FilteredOrdersControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FilteredOrdersController,
        List<Order>> {
  /// See also [FilteredOrdersController].
  FilteredOrdersControllerProvider(
    String filter,
  ) : this._internal(
          () => FilteredOrdersController()..filter = filter,
          from: filteredOrdersControllerProvider,
          name: r'filteredOrdersControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredOrdersControllerHash,
          dependencies: FilteredOrdersControllerFamily._dependencies,
          allTransitiveDependencies:
              FilteredOrdersControllerFamily._allTransitiveDependencies,
          filter: filter,
        );

  FilteredOrdersControllerProvider._internal(
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
  FutureOr<List<Order>> runNotifierBuild(
    covariant FilteredOrdersController notifier,
  ) {
    return notifier.build(
      filter,
    );
  }

  @override
  Override overrideWith(FilteredOrdersController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredOrdersControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FilteredOrdersController, List<Order>>
      createElement() {
    return _FilteredOrdersControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredOrdersControllerProvider && other.filter == filter;
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
mixin FilteredOrdersControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Order>> {
  /// The parameter `filter` of this provider.
  String get filter;
}

class _FilteredOrdersControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FilteredOrdersController,
        List<Order>> with FilteredOrdersControllerRef {
  _FilteredOrdersControllerProviderElement(super.provider);

  @override
  String get filter => (origin as FilteredOrdersControllerProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
