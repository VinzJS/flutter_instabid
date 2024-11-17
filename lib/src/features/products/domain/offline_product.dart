import 'package:dart_mappable/dart_mappable.dart';

part 'offline_product.mapper.dart';

@MappableClass()
class OfflineProduct with OfflineProductMappable {
  final String id;

  final String name;

  final String? displayImage;

  final String? description;

  final double price;

  final bool isBiddable;

  final String? store;

  final String? bidStart;
  final String? bidEnd;

  static const fromMap = OfflineProductMapper.fromMap;
  static const fromJson = OfflineProductMapper.fromJson;

  OfflineProduct({
    required this.id,
    required this.price,
    required this.name,
    required this.isBiddable,
    required this.store,
    this.description,
    this.displayImage,
    this.bidStart,
    this.bidEnd,

    ///
    ///
    ///
  });
}
