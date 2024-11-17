// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tagControllerHash() => r'a8238a110748a19b0e1230b436a1b7cdc326b126';

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

abstract class _$TagController extends BuildlessAutoDisposeAsyncNotifier<Tag> {
  late final String id;

  FutureOr<Tag> build(
    String id,
  );
}

/// See also [TagController].
@ProviderFor(TagController)
const tagControllerProvider = TagControllerFamily();

/// See also [TagController].
class TagControllerFamily extends Family<AsyncValue<Tag>> {
  /// See also [TagController].
  const TagControllerFamily();

  /// See also [TagController].
  TagControllerProvider call(
    String id,
  ) {
    return TagControllerProvider(
      id,
    );
  }

  @override
  TagControllerProvider getProviderOverride(
    covariant TagControllerProvider provider,
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
  String? get name => r'tagControllerProvider';
}

/// See also [TagController].
class TagControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TagController, Tag> {
  /// See also [TagController].
  TagControllerProvider(
    String id,
  ) : this._internal(
          () => TagController()..id = id,
          from: tagControllerProvider,
          name: r'tagControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tagControllerHash,
          dependencies: TagControllerFamily._dependencies,
          allTransitiveDependencies:
              TagControllerFamily._allTransitiveDependencies,
          id: id,
        );

  TagControllerProvider._internal(
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
  FutureOr<Tag> runNotifierBuild(
    covariant TagController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(TagController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TagControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<TagController, Tag> createElement() {
    return _TagControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TagControllerProvider && other.id == id;
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
mixin TagControllerRef on AutoDisposeAsyncNotifierProviderRef<Tag> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TagControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TagController, Tag>
    with TagControllerRef {
  _TagControllerProviderElement(super.provider);

  @override
  String get id => (origin as TagControllerProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
