

part of 'tag_products_controller.dart';



String _$tagProductsControllerHash() =>
    r'25f557b9dee5617602c78634c1204b4fbb4a6ae3';


class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
   
    hash = 0x1fffffff & (hash + value);

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

abstract class _$TagProductsController
    extends BuildlessAutoDisposeAsyncNotifier<TagProductResult> {
  late final String tagId;

  FutureOr<TagProductResult> build(
    String tagId,
  );
}

 [TagProductsController].
@ProviderFor(TagProductsController)
const tagProductsControllerProvider = TagProductsControllerFamily();

 [TagProductsController].
class TagProductsControllerFamily extends Family<AsyncValue<TagProductResult>> {
  [TagProductsController].
  const TagProductsControllerFamily();

  [TagProductsController].
  TagProductsControllerProvider call(
    String tagId,
  ) {
    return TagProductsControllerProvider(
      tagId,
    );
  }

  @override
  TagProductsControllerProvider getProviderOverride(
    covariant TagProductsControllerProvider provider,
  ) {
    return call(
      provider.tagId,
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
  String? get name => r'tagProductsControllerProvider';
}

/// See also [TagProductsController].
class TagProductsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TagProductsController,
        TagProductResult> {
  /// See also [TagProductsController].
  TagProductsControllerProvider(
    String tagId,
  ) : this._internal(
          () => TagProductsController()..tagId = tagId,
          from: tagProductsControllerProvider,
          name: r'tagProductsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tagProductsControllerHash,
          dependencies: TagProductsControllerFamily._dependencies,
          allTransitiveDependencies:
              TagProductsControllerFamily._allTransitiveDependencies,
          tagId: tagId,
        );

  TagProductsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tagId,
  }) : super.internal();

  final String tagId;

  @override
  FutureOr<TagProductResult> runNotifierBuild(
    covariant TagProductsController notifier,
  ) {
    return notifier.build(
      tagId,
    );
  }

  @override
  Override overrideWith(TagProductsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TagProductsControllerProvider._internal(
        () => create()..tagId = tagId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tagId: tagId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TagProductsController,
      TagProductResult> createElement() {
    return _TagProductsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TagProductsControllerProvider && other.tagId == tagId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tagId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TagProductsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<TagProductResult> {

  String get tagId;
}

class _TagProductsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TagProductsController,
        TagProductResult> with TagProductsControllerRef {
  _TagProductsControllerProviderElement(super.provider);

  @override
  String get tagId => (origin as TagProductsControllerProvider).tagId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
