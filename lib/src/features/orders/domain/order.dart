import 'package:dart_mappable/dart_mappable.dart';
import 'package:instabid/src/_index.dart';

part 'order.mapper.dart';

@MappableClass()
class Order with OrderMappable {
  final String id;
  final String? status;
  final Product productCopy;
  final int amount;
  final double total;

  static const fromMap = OrderMapper.fromMap;
  static const fromJson = OrderMapper.fromJson;

  Order({
    required this.id,
    this.status,
    required this.productCopy,
    this.amount = 0,
    this.total = 0.0,
  });

  OrderStatus get orderStatus {
    switch (status) {
      case 'pending':
        return OrderStatus.pending;
      case 'completed':
        return OrderStatus.completed;
      case 'cancelled':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.unkown;
    }
  }
}

enum OrderStatus {
  pending,
  completed,
  cancelled,
  unkown,
}
