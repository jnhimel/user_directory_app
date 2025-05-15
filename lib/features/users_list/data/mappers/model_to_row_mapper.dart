import '../../../../core/db/app_database.dart';
import '../models/users_response_model.dart';

extension UserX on UserModel {
  User toRow() {
    return User(
      id: id ?? -1,
      email: email ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      avatar: avatar ?? '',
    );
  }
}
