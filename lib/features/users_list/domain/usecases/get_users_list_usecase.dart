import 'package:fpdart/src/either.dart';
import 'package:user_directory_app/core/error/failures.dart';
import 'package:user_directory_app/core/usecases/usecase.dart';
import 'package:user_directory_app/features/users_list/domain/repository/user_repository.dart';

import '../entities/get_user_list_params.dart';
import '../entities/user_entity.dart';

class GetUsersListUseCase
    extends UseCase<List<UserEntity>, GetUsersListParams> {
  final UserRepository _userRepository;

  GetUsersListUseCase(this._userRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call({GetUsersListParams? params}) {
    return _userRepository.getUsers(
      page: params?.page,
      perPage: params?.perPage,
      query: params?.query,
    );
  }
}
