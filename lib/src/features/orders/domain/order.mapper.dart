// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'order.dart';

class OrderMapper extends ClassMapperBase<Order> {
  OrderMapper._();

  static OrderMapper? _instance;
  static OrderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrderMapper._());
      ProductMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Order';

  static String _$id(Order v) => v.id;
  static const Field<Order, String> _f$id = Field('id', _$id);
  static String? _$status(Order v) => v.status;
  static const Field<Order, String> _f$status =
      Field('status', _$status, opt: true);
  static Product _$productCopy(Order v) => v.productCopy;
  static const Field<Order, Product> _f$productCopy =
      Field('productCopy', _$productCopy);
  static int _$amount(Order v) => v.amount;
  static const Field<Order, int> _f$amount =
      Field('amount', _$amount, opt: true, def: 0);
  static double _$total(Order v) => v.total;
  static const Field<Order, double> _f$total =
      Field('total', _$total, opt: true, def: 0.0);

  @override
  final MappableFields<Order> fields = const {
    #id: _f$id,
    #status: _f$status,
    #productCopy: _f$productCopy,
    #amount: _f$amount,
    #total: _f$total,
  };

  static Order _instantiate(DecodingData data) {
    return Order(
        id: data.dec(_f$id),
        status: data.dec(_f$status),
        productCopy: data.dec(_f$productCopy),
        amount: data.dec(_f$amount),
        total: data.dec(_f$total));
  }

  @override
  final Function instantiate = _instantiate;

  static Order fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Order>(map);
  }

  static Order fromJson(String json) {
    return ensureInitialized().decodeJson<Order>(json);
  }
}

mixin OrderMappable {
  String toJson() {
    return OrderMapper.ensureInitialized().encodeJson<Order>(this as Order);
  }

  Map<String, dynamic> toMap() {
    return OrderMapper.ensureInitialized().encodeMap<Order>(this as Order);
  }

  OrderCopyWith<Order, Order, Order> get copyWith =>
      _OrderCopyWithImpl(this as Order, $identity, $identity);
  @override
  String toString() {
    return OrderMapper.ensureInitialized().stringifyValue(this as Order);
  }

  @override
  bool operator ==(Object other) {
    return OrderMapper.ensureInitialized().equalsValue(this as Order, other);
  }

  @override
  int get hashCode {
    return OrderMapper.ensureInitialized().hashValue(this as Order);
  }
}

extension OrderValueCopy<$R, $Out> on ObjectCopyWith<$R, Order, $Out> {
  OrderCopyWith<$R, Order, $Out> get $asOrder =>
      $base.as((v, t, t2) => _OrderCopyWithImpl(v, t, t2));
}

abstract class OrderCopyWith<$R, $In extends Order, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ProductCopyWith<$R, Product, Product> get productCopy;
  $R call(
      {String? id,
      String? status,
      Product? productCopy,
      int? amount,
      double? total});
  OrderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrderCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Order, $Out>
    implements OrderCopyWith<$R, Order, $Out> {
  _OrderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Order> $mapper = OrderMapper.ensureInitialized();
  @override
  ProductCopyWith<$R, Product, Product> get productCopy =>
      $value.productCopy.copyWith.$chain((v) => call(productCopy: v));
  @override
  $R call(
          {String? id,
          Object? status = $none,
          Product? productCopy,
          int? amount,
          double? total}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (status != $none) #status: status,
        if (productCopy != null) #productCopy: productCopy,
        if (amount != null) #amount: amount,
        if (total != null) #total: total
      }));
  @override
  Order $make(CopyWithData data) => Order(
      id: data.get(#id, or: $value.id),
      status: data.get(#status, or: $value.status),
      productCopy: data.get(#productCopy, or: $value.productCopy),
      amount: data.get(#amount, or: $value.amount),
      total: data.get(#total, or: $value.total));

  @override
  OrderCopyWith<$R2, Order, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _OrderCopyWithImpl($value, $cast, t);
}
