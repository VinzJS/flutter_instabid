// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'store_front.dart';

class StoreFrontMapper extends ClassMapperBase<StoreFront> {
  StoreFrontMapper._();

  static StoreFrontMapper? _instance;
  static StoreFrontMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StoreFrontMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StoreFront';

  static bool _$isPublished(StoreFront v) => v.isPublished;
  static const Field<StoreFront, bool> _f$isPublished =
      Field('isPublished', _$isPublished, opt: true, def: true);
  static String _$id(StoreFront v) => v.id;
  static const Field<StoreFront, String> _f$id = Field('id', _$id);
  static String _$name(StoreFront v) => v.name;
  static const Field<StoreFront, String> _f$name = Field('name', _$name);
  static String? _$description(StoreFront v) => v.description;
  static const Field<StoreFront, String> _f$description =
      Field('description', _$description);
  static String? _$address(StoreFront v) => v.address;
  static const Field<StoreFront, String> _f$address =
      Field('address', _$address);
  static String? _$contactNumber(StoreFront v) => v.contactNumber;
  static const Field<StoreFront, String> _f$contactNumber =
      Field('contactNumber', _$contactNumber);
  static String? _$displayImage(StoreFront v) => v.displayImage;
  static const Field<StoreFront, String> _f$displayImage =
      Field('displayImage', _$displayImage, opt: true);
  static double _$rating(StoreFront v) => v.rating;
  static const Field<StoreFront, double> _f$rating =
      Field('rating', _$rating, opt: true, def: 5.0);

  @override
  final MappableFields<StoreFront> fields = const {
    #isPublished: _f$isPublished,
    #id: _f$id,
    #name: _f$name,
    #description: _f$description,
    #address: _f$address,
    #contactNumber: _f$contactNumber,
    #displayImage: _f$displayImage,
    #rating: _f$rating,
  };

  static StoreFront _instantiate(DecodingData data) {
    return StoreFront(
        isPublished: data.dec(_f$isPublished),
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        description: data.dec(_f$description),
        address: data.dec(_f$address),
        contactNumber: data.dec(_f$contactNumber),
        displayImage: data.dec(_f$displayImage),
        rating: data.dec(_f$rating));
  }

  @override
  final Function instantiate = _instantiate;

  static StoreFront fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StoreFront>(map);
  }

  static StoreFront fromJson(String json) {
    return ensureInitialized().decodeJson<StoreFront>(json);
  }
}

mixin StoreFrontMappable {
  String toJson() {
    return StoreFrontMapper.ensureInitialized()
        .encodeJson<StoreFront>(this as StoreFront);
  }

  Map<String, dynamic> toMap() {
    return StoreFrontMapper.ensureInitialized()
        .encodeMap<StoreFront>(this as StoreFront);
  }

  StoreFrontCopyWith<StoreFront, StoreFront, StoreFront> get copyWith =>
      _StoreFrontCopyWithImpl(this as StoreFront, $identity, $identity);
  @override
  String toString() {
    return StoreFrontMapper.ensureInitialized()
        .stringifyValue(this as StoreFront);
  }

  @override
  bool operator ==(Object other) {
    return StoreFrontMapper.ensureInitialized()
        .equalsValue(this as StoreFront, other);
  }

  @override
  int get hashCode {
    return StoreFrontMapper.ensureInitialized().hashValue(this as StoreFront);
  }
}

extension StoreFrontValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StoreFront, $Out> {
  StoreFrontCopyWith<$R, StoreFront, $Out> get $asStoreFront =>
      $base.as((v, t, t2) => _StoreFrontCopyWithImpl(v, t, t2));
}

abstract class StoreFrontCopyWith<$R, $In extends StoreFront, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {bool? isPublished,
      String? id,
      String? name,
      String? description,
      String? address,
      String? contactNumber,
      String? displayImage,
      double? rating});
  StoreFrontCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StoreFrontCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StoreFront, $Out>
    implements StoreFrontCopyWith<$R, StoreFront, $Out> {
  _StoreFrontCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StoreFront> $mapper =
      StoreFrontMapper.ensureInitialized();
  @override
  $R call(
          {bool? isPublished,
          String? id,
          String? name,
          Object? description = $none,
          Object? address = $none,
          Object? contactNumber = $none,
          Object? displayImage = $none,
          double? rating}) =>
      $apply(FieldCopyWithData({
        if (isPublished != null) #isPublished: isPublished,
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (description != $none) #description: description,
        if (address != $none) #address: address,
        if (contactNumber != $none) #contactNumber: contactNumber,
        if (displayImage != $none) #displayImage: displayImage,
        if (rating != null) #rating: rating
      }));
  @override
  StoreFront $make(CopyWithData data) => StoreFront(
      isPublished: data.get(#isPublished, or: $value.isPublished),
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      description: data.get(#description, or: $value.description),
      address: data.get(#address, or: $value.address),
      contactNumber: data.get(#contactNumber, or: $value.contactNumber),
      displayImage: data.get(#displayImage, or: $value.displayImage),
      rating: data.get(#rating, or: $value.rating));

  @override
  StoreFrontCopyWith<$R2, StoreFront, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StoreFrontCopyWithImpl($value, $cast, t);
}
