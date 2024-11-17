// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'offline_product.dart';

class OfflineProductMapper extends ClassMapperBase<OfflineProduct> {
  OfflineProductMapper._();

  static OfflineProductMapper? _instance;
  static OfflineProductMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OfflineProductMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'OfflineProduct';

  static String _$id(OfflineProduct v) => v.id;
  static const Field<OfflineProduct, String> _f$id = Field('id', _$id);
  static double _$price(OfflineProduct v) => v.price;
  static const Field<OfflineProduct, double> _f$price = Field('price', _$price);
  static String _$name(OfflineProduct v) => v.name;
  static const Field<OfflineProduct, String> _f$name = Field('name', _$name);
  static bool _$isBiddable(OfflineProduct v) => v.isBiddable;
  static const Field<OfflineProduct, bool> _f$isBiddable =
      Field('isBiddable', _$isBiddable);
  static String? _$store(OfflineProduct v) => v.store;
  static const Field<OfflineProduct, String> _f$store = Field('store', _$store);
  static String? _$description(OfflineProduct v) => v.description;
  static const Field<OfflineProduct, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$displayImage(OfflineProduct v) => v.displayImage;
  static const Field<OfflineProduct, String> _f$displayImage =
      Field('displayImage', _$displayImage, opt: true);
  static String? _$bidStart(OfflineProduct v) => v.bidStart;
  static const Field<OfflineProduct, String> _f$bidStart =
      Field('bidStart', _$bidStart, opt: true);
  static String? _$bidEnd(OfflineProduct v) => v.bidEnd;
  static const Field<OfflineProduct, String> _f$bidEnd =
      Field('bidEnd', _$bidEnd, opt: true);

  @override
  final MappableFields<OfflineProduct> fields = const {
    #id: _f$id,
    #price: _f$price,
    #name: _f$name,
    #isBiddable: _f$isBiddable,
    #store: _f$store,
    #description: _f$description,
    #displayImage: _f$displayImage,
    #bidStart: _f$bidStart,
    #bidEnd: _f$bidEnd,
  };

  static OfflineProduct _instantiate(DecodingData data) {
    return OfflineProduct(
        id: data.dec(_f$id),
        price: data.dec(_f$price),
        name: data.dec(_f$name),
        isBiddable: data.dec(_f$isBiddable),
        store: data.dec(_f$store),
        description: data.dec(_f$description),
        displayImage: data.dec(_f$displayImage),
        bidStart: data.dec(_f$bidStart),
        bidEnd: data.dec(_f$bidEnd));
  }

  @override
  final Function instantiate = _instantiate;

  static OfflineProduct fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OfflineProduct>(map);
  }

  static OfflineProduct fromJson(String json) {
    return ensureInitialized().decodeJson<OfflineProduct>(json);
  }
}

mixin OfflineProductMappable {
  String toJson() {
    return OfflineProductMapper.ensureInitialized()
        .encodeJson<OfflineProduct>(this as OfflineProduct);
  }

  Map<String, dynamic> toMap() {
    return OfflineProductMapper.ensureInitialized()
        .encodeMap<OfflineProduct>(this as OfflineProduct);
  }

  OfflineProductCopyWith<OfflineProduct, OfflineProduct, OfflineProduct>
      get copyWith => _OfflineProductCopyWithImpl(
          this as OfflineProduct, $identity, $identity);
  @override
  String toString() {
    return OfflineProductMapper.ensureInitialized()
        .stringifyValue(this as OfflineProduct);
  }

  @override
  bool operator ==(Object other) {
    return OfflineProductMapper.ensureInitialized()
        .equalsValue(this as OfflineProduct, other);
  }

  @override
  int get hashCode {
    return OfflineProductMapper.ensureInitialized()
        .hashValue(this as OfflineProduct);
  }
}

extension OfflineProductValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OfflineProduct, $Out> {
  OfflineProductCopyWith<$R, OfflineProduct, $Out> get $asOfflineProduct =>
      $base.as((v, t, t2) => _OfflineProductCopyWithImpl(v, t, t2));
}

abstract class OfflineProductCopyWith<$R, $In extends OfflineProduct, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      double? price,
      String? name,
      bool? isBiddable,
      String? store,
      String? description,
      String? displayImage,
      String? bidStart,
      String? bidEnd});
  OfflineProductCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OfflineProductCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OfflineProduct, $Out>
    implements OfflineProductCopyWith<$R, OfflineProduct, $Out> {
  _OfflineProductCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OfflineProduct> $mapper =
      OfflineProductMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          double? price,
          String? name,
          bool? isBiddable,
          Object? store = $none,
          Object? description = $none,
          Object? displayImage = $none,
          Object? bidStart = $none,
          Object? bidEnd = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (price != null) #price: price,
        if (name != null) #name: name,
        if (isBiddable != null) #isBiddable: isBiddable,
        if (store != $none) #store: store,
        if (description != $none) #description: description,
        if (displayImage != $none) #displayImage: displayImage,
        if (bidStart != $none) #bidStart: bidStart,
        if (bidEnd != $none) #bidEnd: bidEnd
      }));
  @override
  OfflineProduct $make(CopyWithData data) => OfflineProduct(
      id: data.get(#id, or: $value.id),
      price: data.get(#price, or: $value.price),
      name: data.get(#name, or: $value.name),
      isBiddable: data.get(#isBiddable, or: $value.isBiddable),
      store: data.get(#store, or: $value.store),
      description: data.get(#description, or: $value.description),
      displayImage: data.get(#displayImage, or: $value.displayImage),
      bidStart: data.get(#bidStart, or: $value.bidStart),
      bidEnd: data.get(#bidEnd, or: $value.bidEnd));

  @override
  OfflineProductCopyWith<$R2, OfflineProduct, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OfflineProductCopyWithImpl($value, $cast, t);
}
