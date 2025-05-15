import '../../../../core/db/app_database.dart';
import '../../domain/entities/user_entity.dart';

extension UserX on UserEntity {
  User toRow() {
    return User(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
    );
  }
}
