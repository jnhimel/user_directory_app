import '../../../../core/db/app_database.dart';
import '../../domain/entities/user_entity.dart';

extension UserX on User {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      avatar: avatar ?? '',
    );
  }
}
