import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  String get fullName => '$firstName $lastName';
}
