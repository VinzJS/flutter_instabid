// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_bids_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredBidsControllerHash() =>
    r'f7bdfcd8eed172800d637972be6ec461a1e56dfd';

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

abstract class _$FilteredBidsController
    extends BuildlessAutoDisposeAsyncNotifier<List<Bid>> {
  late final String filter;

  FutureOr<List<Bid>> build(
    String filter,
  );
}

/// See also [FilteredBidsController].
@ProviderFor(FilteredBidsController)
const filteredBidsControllerProvider = FilteredBidsControllerFamily();

/// See also [FilteredBidsController].
class FilteredBidsControllerFamily extends Family<AsyncValue<List<Bid>>> {
  /// See also [FilteredBidsController].
  const FilteredBidsControllerFamily();

  /// See also [FilteredBidsController].
  FilteredBidsControllerProvider call(
    String filter,
  ) {
    return FilteredBidsControllerProvider(
      filter,
    );
  }

  @override
  FilteredBidsControllerProvider getProviderOverride(
    covariant FilteredBidsControllerProvider provider,
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
  String? get name => r'filteredBidsControllerProvider';
}

/// See also [FilteredBidsController].
class FilteredBidsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<FilteredBidsController,
        List<Bid>> {
  /// See also [FilteredBidsController].
  FilteredBidsControllerProvider(
    String filter,
  ) : this._internal(
          () => FilteredBidsController()..filter = filter,
          from: filteredBidsControllerProvider,
          name: r'filteredBidsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredBidsControllerHash,
          dependencies: FilteredBidsControllerFamily._dependencies,
          allTransitiveDependencies:
              FilteredBidsControllerFamily._allTransitiveDependencies,
          filter: filter,
        );

  FilteredBidsControllerProvider._internal(
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
  FutureOr<List<Bid>> runNotifierBuild(
    covariant FilteredBidsController notifier,
  ) {
    return notifier.build(
      filter,
    );
  }

  @override
  Override overrideWith(FilteredBidsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: FilteredBidsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<FilteredBidsController, List<Bid>>
      createElement() {
    return _FilteredBidsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredBidsControllerProvider && other.filter == filter;
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
mixin FilteredBidsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Bid>> {
  /// The parameter `filter` of this provider.
  String get filter;
}

class _FilteredBidsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FilteredBidsController,
        List<Bid>> with FilteredBidsControllerRef {
  _FilteredBidsControllerProviderElement(super.provider);

  @override
  String get filter => (origin as FilteredBidsControllerProvider).filter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
