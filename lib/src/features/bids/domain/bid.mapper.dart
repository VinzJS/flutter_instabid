// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bid.dart';

class BidMapper extends ClassMapperBase<Bid> {
  BidMapper._();

  static BidMapper? _instance;
  static BidMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BidMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Bid';

  static String _$id(Bid v) => v.id;
  static const Field<Bid, String> _f$id = Field('id', _$id);
  static String _$product(Bid v) => v.product;
  static const Field<Bid, String> _f$product = Field('product', _$product);
  static String _$user(Bid v) => v.user;
  static const Field<Bid, String> _f$user = Field('user', _$user);
  static DateTime _$created(Bid v) => v.created;
  static const Field<Bid, DateTime> _f$created = Field('created', _$created);
  static DateTime _$updated(Bid v) => v.updated;
  static const Field<Bid, DateTime> _f$updated = Field('updated', _$updated);
  static double _$amount(Bid v) => v.amount;
  static const Field<Bid, double> _f$amount = Field('amount', _$amount);

  @override
  final MappableFields<Bid> fields = const {
    #id: _f$id,
    #product: _f$product,
    #user: _f$user,
    #created: _f$created,
    #updated: _f$updated,
    #amount: _f$amount,
  };

  static Bid _instantiate(DecodingData data) {
    return Bid(
        id: data.dec(_f$id),
        product: data.dec(_f$product),
        user: data.dec(_f$user),
        created: data.dec(_f$created),
        updated: data.dec(_f$updated),
        amount: data.dec(_f$amount));
  }

  @override
  final Function instantiate = _instantiate;

  static Bid fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Bid>(map);
  }

  static Bid fromJson(String json) {
    return ensureInitialized().decodeJson<Bid>(json);
  }
}

mixin BidMappable {
  String toJson() {
    return BidMapper.ensureInitialized().encodeJson<Bid>(this as Bid);
  }

  Map<String, dynamic> toMap() {
    return BidMapper.ensureInitialized().encodeMap<Bid>(this as Bid);
  }

  BidCopyWith<Bid, Bid, Bid> get copyWith =>
      _BidCopyWithImpl(this as Bid, $identity, $identity);
  @override
  String toString() {
    return BidMapper.ensureInitialized().stringifyValue(this as Bid);
  }

  @override
  bool operator ==(Object other) {
    return BidMapper.ensureInitialized().equalsValue(this as Bid, other);
  }

  @override
  int get hashCode {
    return BidMapper.ensureInitialized().hashValue(this as Bid);
  }
}

extension BidValueCopy<$R, $Out> on ObjectCopyWith<$R, Bid, $Out> {
  BidCopyWith<$R, Bid, $Out> get $asBid =>
      $base.as((v, t, t2) => _BidCopyWithImpl(v, t, t2));
}

abstract class BidCopyWith<$R, $In extends Bid, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? product,
      String? user,
      DateTime? created,
      DateTime? updated,
      double? amount});
  BidCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BidCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Bid, $Out>
    implements BidCopyWith<$R, Bid, $Out> {
  _BidCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Bid> $mapper = BidMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? product,
          String? user,
          DateTime? created,
          DateTime? updated,
          double? amount}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (product != null) #product: product,
        if (user != null) #user: user,
        if (created != null) #created: created,
        if (updated != null) #updated: updated,
        if (amount != null) #amount: amount
      }));
  @override
  Bid $make(CopyWithData data) => Bid(
      id: data.get(#id, or: $value.id),
      product: data.get(#product, or: $value.product),
      user: data.get(#user, or: $value.user),
      created: data.get(#created, or: $value.created),
      updated: data.get(#updated, or: $value.updated),
      amount: data.get(#amount, or: $value.amount));

  @override
  BidCopyWith<$R2, Bid, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BidCopyWithImpl($value, $cast, t);
}
