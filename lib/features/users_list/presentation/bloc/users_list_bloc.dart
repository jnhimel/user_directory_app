import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_directory_app/features/users_list/domain/entities/get_user_list_params.dart';
import 'package:user_directory_app/features/users_list/domain/usecases/get_users_list_usecase.dart';
import 'package:user_directory_app/features/users_list/presentation/bloc/users_list_event.dart';
import '../../domain/entities/user_entity.dart';

class UsersListBloc extends Bloc<UsersListEvent, PagingState<int, UserEntity>> {
  final GetUsersListUseCase _getUsersListUseCase;

  UsersListBloc(this._getUsersListUseCase) : super(PagingState()) {
    on<GetUsersListFirstPage>(onGetUserListFirstPage);
    on<GetUsersListNextPage>(onGetUserListNextPage);
  }

  void onGetUserListFirstPage(
    GetUsersListFirstPage event,
    Emitter<PagingState<int, UserEntity>> emitter,
  ) async {
    if (state.isLoading) return;
    final newState = PagingState<int, UserEntity>();
    emitter(newState.copyWith(isLoading: true, error: null));
    final newKey = (newState.keys?.last ?? 0) + 1;
    final result = await _getUsersListUseCase(
      params: GetUsersListParams(page: newKey, query: event.params?.query),
    );
    result.fold(
      (l) {
        emitter(newState.copyWith(error: l.message, isLoading: false));
      },
      (r) {
        final newItems = r;
        final isLastPage = newItems.isEmpty;
        emitter(
          state.copyWith(
            pages: [...?state.pages, newItems],
            keys: [...?state.keys, newKey],
            hasNextPage: !isLastPage,
            isLoading: false,
          ),
        );
      },
    );
  }

  void onGetUserListNextPage(
    GetUsersListNextPage event,
    Emitter<PagingState<int, UserEntity>> emitter,
  ) async {
    if (state.isLoading) return;
    emitter(state.copyWith(isLoading: true, error: null));
    final newKey = (state.keys?.last ?? 0) + 1;
    final result = await _getUsersListUseCase(
      params: GetUsersListParams(page: newKey),
    );
    result.fold(
      (l) {
        emitter(state.copyWith(error: l.message, isLoading: false));
      },
      (r) {
        final newItems = r;
        final isLastPage = newItems.isEmpty;
        emitter(
          state.copyWith(
            pages: [...?state.pages, newItems],
            keys: [...?state.keys, newKey],
            hasNextPage: !isLastPage,
            isLoading: false,
          ),
        );
      },
    );
  }
}
