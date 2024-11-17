import 'package:dart_mappable/dart_mappable.dart';

part 'user.mapper.dart';

@MappableClass()
class User with UserMappable {
  final String id;

  final String name;
  final String email;
  final String? profilePhoto;
  final bool isStoreOwner;

  static const fromMap = UserMapper.fromMap;
  static const fromJson = UserMapper.fromJson;

  bool get hasPicture => profilePhoto is String && profilePhoto!.isNotEmpty;

  User({
    required this.id,
    required this.name,
    this.isStoreOwner = false,
    this.email = '',
    this.profilePhoto,
  });
}
