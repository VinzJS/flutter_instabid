import 'package:dart_mappable/dart_mappable.dart';

part 'bid.mapper.dart';

@MappableClass()
class Bid with BidMappable {
  final String id;
  final String product;
  final String user;
  final double amount;

  final DateTime created;
  final DateTime updated;

  static const fromMap = BidMapper.fromMap;
  static const fromJson = BidMapper.fromJson;

  Bid({
    required this.id,
    required this.product,
    required this.user,
    required this.created,
    required this.updated,
    required this.amount,
  });
}
