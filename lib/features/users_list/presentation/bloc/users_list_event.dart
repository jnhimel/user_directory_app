import '../../domain/entities/get_user_list_params.dart';

abstract class UsersListEvent {
  final GetUsersListParams? params;

  const UsersListEvent({this.params});
}

class GetUsersListFirstPage extends UsersListEvent {
  const GetUsersListFirstPage({super.params});
}

class GetUsersListNextPage extends UsersListEvent {
  const GetUsersListNextPage({super.params});
}
