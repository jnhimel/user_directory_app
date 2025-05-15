import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:user_directory_app/core/constants/constants.dart';
import 'package:user_directory_app/features/users_list/data/models/users_response_model.dart';

part 'users_api_service.g.dart';

@RestApi(baseUrl: usersAPIBaseURL)
abstract class UsersApiService {
  factory UsersApiService(Dio dio) = _UsersApiService;

  @GET('/users')
  Future<HttpResponse<UsersResponseModel>> getNewsArticles({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
  });
}
