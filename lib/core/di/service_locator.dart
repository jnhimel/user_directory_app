import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:user_directory_app/core/constants/constants.dart';
import 'package:user_directory_app/core/db/app_database.dart';
import 'package:user_directory_app/features/users_list/data/datasources/local/db/dao/user_dao.dart';
import 'package:user_directory_app/features/users_list/data/datasources/remote/users_api_service.dart';
import 'package:user_directory_app/features/users_list/data/repository/user_repository_impl.dart';
import 'package:user_directory_app/features/users_list/domain/repository/user_repository.dart';
import 'package:user_directory_app/features/users_list/domain/usecases/get_users_list_usecase.dart';
import 'package:user_directory_app/features/users_list/presentation/bloc/users_list_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<Dio>(
    Dio()
      ..interceptors.addAll([
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['x-api-key'] = usersAPIKey;
            return handler.next(options);
          },
          onResponse: (response, handler) => handler.next(response),
          onError: (error, handler) => handler.next(error),
        ),
        PrettyDioLogger(
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          error: kDebugMode,
          compact: true,
          maxWidth: 90,
        ),
      ]),
  );
  serviceLocator.registerSingleton<UsersApiService>(
    UsersApiService(serviceLocator()),
  );
  serviceLocator.registerSingleton<AppDatabase>(AppDatabase.defaults());
  serviceLocator.registerSingleton<UserDAO>(
    serviceLocator<AppDatabase>().userDAO,
  );
  serviceLocator.registerSingleton<Connectivity>(Connectivity());
  serviceLocator.registerSingleton<UserRepository>(
    UserRepositoryImpl(serviceLocator(), serviceLocator(), serviceLocator()),
  );
  serviceLocator.registerSingleton<GetUsersListUseCase>(
    GetUsersListUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory<UsersListBloc>(
    () => UsersListBloc(serviceLocator()),
  );
}
