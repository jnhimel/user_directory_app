import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/src/either.dart';
import 'package:user_directory_app/core/error/failures.dart';
import 'package:user_directory_app/features/users_list/data/datasources/local/db/dao/user_dao.dart';
import 'package:user_directory_app/features/users_list/data/datasources/remote/users_api_service.dart';
import 'package:user_directory_app/features/users_list/data/mappers/model_to_entity_mapper.dart';
import 'package:user_directory_app/features/users_list/data/mappers/model_to_row_mapper.dart';
import 'package:user_directory_app/features/users_list/data/mappers/table_row_to_entity_mapper.dart';
import 'package:user_directory_app/features/users_list/domain/entities/user_entity.dart';
import 'package:user_directory_app/features/users_list/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UsersApiService _usersApiService;
  final UserDAO _userDAO;
  final Connectivity _connectivity;

  const UserRepositoryImpl(
    this._usersApiService,
    this._userDAO,
    this._connectivity,
  );

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers({
    int? page,
    int? perPage,
    String? query,
  }) async {
    if (query != null && query.isNotEmpty) {
      final localUsers = await _userDAO.getAllUsers();
      final filteredUsers =
          localUsers
              .where(
                (user) =>
                    (user.firstName?.toLowerCase().contains(
                          query.toLowerCase(),
                        ) ??
                        false) ||
                    (user.lastName?.toLowerCase().contains(
                          query.toLowerCase(),
                        ) ??
                        false),
              )
              .map((e) => e.toEntity())
              .toList();
      return right(filteredUsers);
    } else {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (!connectivityResult.contains(ConnectivityResult.none)) {
        try {
          final httpResponse = await _usersApiService.getNewsArticles(
            perPage: perPage ?? 10,
            page: page ?? 1,
          );
          if (httpResponse.response.statusCode == HttpStatus.ok) {
            httpResponse.data.data?.forEach((e) {
              _userDAO.insertOrUpdateUser(e.toRow());
            });
            return right(
              httpResponse.data.data?.map((e) => e.toEntity()).toList() ?? [],
            );
          } else {
            return left(
              Failure(
                httpResponse.response.statusMessage ??
                    'An unexpected error occurred!',
              ),
            );
          }
        } catch (e) {
          return left(Failure(e.toString()));
        }
      } else {
        final localUsers = await _userDAO.getAllUsersWithPage(page ?? 1, 10);
        if (localUsers.isNotEmpty) {
          return right(localUsers.map((e) => e.toEntity()).toList());
        } else {
          return left(Failure('No internet connection and no local data!'));
        }
      }
    }
  }
}
