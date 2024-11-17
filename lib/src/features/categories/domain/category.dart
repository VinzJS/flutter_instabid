import 'package:dart_mappable/dart_mappable.dart';

part 'category.mapper.dart';

@MappableClass()
class Category with CategoryMappable {
  final String id;
  final String name;

  static const fromMap = CategoryMapper.fromMap;
  static const fromJson = CategoryMapper.fromJson;

  Category({required this.id, required this.name});
}
