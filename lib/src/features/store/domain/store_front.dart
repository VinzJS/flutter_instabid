import 'package:dart_mappable/dart_mappable.dart';

part 'store_front.mapper.dart';

@MappableClass()
class StoreFront with StoreFrontMappable {
  final String id;
  final String name;
  final String? description;
  final String? address;
  final double rating;
  final String? displayImage;
  final String? contactNumber;
  final bool isPublished;

  static const fromMap = StoreFrontMapper.fromMap;
  static const fromJson = StoreFrontMapper.fromJson;

  StoreFront({
    this.isPublished = true,
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.contactNumber,
    this.displayImage,
    this.rating = 5.0,
  });
}
