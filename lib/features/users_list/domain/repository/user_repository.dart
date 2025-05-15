import 'package:fpdart/fpdart.dart';
import 'package:user_directory_app/core/error/failures.dart';
import 'package:user_directory_app/features/users_list/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers({
    int? page,
    int? perPage,
    String? query,
  });
}
