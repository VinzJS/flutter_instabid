import 'package:dart_mappable/dart_mappable.dart';

part 'tag.mapper.dart';

@MappableClass()
class Tag with TagMappable {
  final String id;

  final String name;

  final String? icon;

  static const fromMap = TagMapper.fromMap;
  static const fromJson = TagMapper.fromJson;

  Tag({required this.id, required this.name, this.icon});
}
