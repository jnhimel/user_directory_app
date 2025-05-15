import 'package:user_directory_app/features/users_list/data/models/users_response_model.dart';

import '../../domain/entities/user_entity.dart';

extension UserX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: id ?? -1,
      email: email ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      avatar: avatar ?? '',
    );
  }
}
