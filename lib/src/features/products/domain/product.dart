import 'package:dart_mappable/dart_mappable.dart';

part 'product.mapper.dart';

@MappableClass()
class Product with ProductMappable {
  final String id;

  final String name;

  final String? displayImage;

  final String? description;

  final double price;

  final bool isBiddable;

  final String store;

  final String? bid;

  final String? bidStart;
  final String? bidEnd;

  final bool isPublished;

  static const fromMap = ProductMapper.fromMap;
  static const fromJson = ProductMapper.fromJson;

  Map<String, dynamic> toFormMap() {
    final values = Map<String, dynamic>.fromEntries(
      toMap().entries.map(
        (e) {
          dynamic value = e.value;
          if (value is int) value = value.toString();
          if (value is double) value = value.toString();
          if (value is DateTime) value = value.toIso8601String();

          return MapEntry(
            e.key,
            value,
          );
        },
      ),
    );
    return values;
  }

  Product({
    required this.id,
    required this.price,
    required this.name,
    required this.isBiddable,
    required this.store,
    this.bid,
    this.isPublished = false,
    this.description,
    this.displayImage,
    this.bidStart,
    this.bidEnd,

    ///
    ///
    ///
  });

  DateTime? get bidStartDate => DateTime.tryParse(bidStart ?? '');
  DateTime? get bidEndDate => DateTime.tryParse(bidEnd ?? '');

  bool get canStillBid {
    if (bidStartDate == null || bidEndDate == null || !isBiddable) return false;

    final now = DateTime.now();
    return bidStartDate!.isBefore(now) && bidEndDate!.isAfter(now);
  }
}
