// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product.dart';

class ProductMapper extends ClassMapperBase<Product> {
  ProductMapper._();

  static ProductMapper? _instance;
  static ProductMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Product';

  static String _$id(Product v) => v.id;
  static const Field<Product, String> _f$id = Field('id', _$id);
  static double _$price(Product v) => v.price;
  static const Field<Product, double> _f$price = Field('price', _$price);
  static String _$name(Product v) => v.name;
  static const Field<Product, String> _f$name = Field('name', _$name);
  static bool _$isBiddable(Product v) => v.isBiddable;
  static const Field<Product, bool> _f$isBiddable =
      Field('isBiddable', _$isBiddable);
  static String _$store(Product v) => v.store;
  static const Field<Product, String> _f$store = Field('store', _$store);
  static String? _$bid(Product v) => v.bid;
  static const Field<Product, String> _f$bid = Field('bid', _$bid, opt: true);
  static bool _$isPublished(Product v) => v.isPublished;
  static const Field<Product, bool> _f$isPublished =
      Field('isPublished', _$isPublished, opt: true, def: false);
  static String? _$description(Product v) => v.description;
  static const Field<Product, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$displayImage(Product v) => v.displayImage;
  static const Field<Product, String> _f$displayImage =
      Field('displayImage', _$displayImage, opt: true);
  static String? _$bidStart(Product v) => v.bidStart;
  static const Field<Product, String> _f$bidStart =
      Field('bidStart', _$bidStart, opt: true);
  static String? _$bidEnd(Product v) => v.bidEnd;
  static const Field<Product, String> _f$bidEnd =
      Field('bidEnd', _$bidEnd, opt: true);

  @override
  final MappableFields<Product> fields = const {
    #id: _f$id,
    #price: _f$price,
    #name: _f$name,
    #isBiddable: _f$isBiddable,
    #store: _f$store,
    #bid: _f$bid,
    #isPublished: _f$isPublished,
    #description: _f$description,
    #displayImage: _f$displayImage,
    #bidStart: _f$bidStart,
    #bidEnd: _f$bidEnd,
  };

  static Product _instantiate(DecodingData data) {
    return Product(
        id: data.dec(_f$id),
        price: data.dec(_f$price),
        name: data.dec(_f$name),
        isBiddable: data.dec(_f$isBiddable),
        store: data.dec(_f$store),
        bid: data.dec(_f$bid),
        isPublished: data.dec(_f$isPublished),
        description: data.dec(_f$description),
        displayImage: data.dec(_f$displayImage),
        bidStart: data.dec(_f$bidStart),
        bidEnd: data.dec(_f$bidEnd));
  }

  @override
  final Function instantiate = _instantiate;

  static Product fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Product>(map);
  }

  static Product fromJson(String json) {
    return ensureInitialized().decodeJson<Product>(json);
  }
}

mixin ProductMappable {
  String toJson() {
    return ProductMapper.ensureInitialized()
        .encodeJson<Product>(this as Product);
  }

  Map<String, dynamic> toMap() {
    return ProductMapper.ensureInitialized()
        .encodeMap<Product>(this as Product);
  }

  ProductCopyWith<Product, Product, Product> get copyWith =>
      _ProductCopyWithImpl(this as Product, $identity, $identity);
  @override
  String toString() {
    return ProductMapper.ensureInitialized().stringifyValue(this as Product);
  }

  @override
  bool operator ==(Object other) {
    return ProductMapper.ensureInitialized()
        .equalsValue(this as Product, other);
  }

  @override
  int get hashCode {
    return ProductMapper.ensureInitialized().hashValue(this as Product);
  }
}

extension ProductValueCopy<$R, $Out> on ObjectCopyWith<$R, Product, $Out> {
  ProductCopyWith<$R, Product, $Out> get $asProduct =>
      $base.as((v, t, t2) => _ProductCopyWithImpl(v, t, t2));
}

abstract class ProductCopyWith<$R, $In extends Product, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      double? price,
      String? name,
      bool? isBiddable,
      String? store,
      String? bid,
      bool? isPublished,
      String? description,
      String? displayImage,
      String? bidStart,
      String? bidEnd});
  ProductCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Product, $Out>
    implements ProductCopyWith<$R, Product, $Out> {
  _ProductCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Product> $mapper =
      ProductMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          double? price,
          String? name,
          bool? isBiddable,
          String? store,
          Object? bid = $none,
          bool? isPublished,
          Object? description = $none,
          Object? displayImage = $none,
          Object? bidStart = $none,
          Object? bidEnd = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (price != null) #price: price,
        if (name != null) #name: name,
        if (isBiddable != null) #isBiddable: isBiddable,
        if (store != null) #store: store,
        if (bid != $none) #bid: bid,
        if (isPublished != null) #isPublished: isPublished,
        if (description != $none) #description: description,
        if (displayImage != $none) #displayImage: displayImage,
        if (bidStart != $none) #bidStart: bidStart,
        if (bidEnd != $none) #bidEnd: bidEnd
      }));
  @override
  Product $make(CopyWithData data) => Product(
      id: data.get(#id, or: $value.id),
      price: data.get(#price, or: $value.price),
      name: data.get(#name, or: $value.name),
      isBiddable: data.get(#isBiddable, or: $value.isBiddable),
      store: data.get(#store, or: $value.store),
      bid: data.get(#bid, or: $value.bid),
      isPublished: data.get(#isPublished, or: $value.isPublished),
      description: data.get(#description, or: $value.description),
      displayImage: data.get(#displayImage, or: $value.displayImage),
      bidStart: data.get(#bidStart, or: $value.bidStart),
      bidEnd: data.get(#bidEnd, or: $value.bidEnd));

  @override
  ProductCopyWith<$R2, Product, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProductCopyWithImpl($value, $cast, t);
}
