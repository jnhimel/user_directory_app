import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_directory_app/config/routes/app_routes.dart';
import 'package:user_directory_app/features/users_list/domain/entities/get_user_list_params.dart';
import 'package:user_directory_app/features/users_list/presentation/bloc/users_list_bloc.dart';
import 'package:user_directory_app/features/users_list/presentation/bloc/users_list_event.dart';
import 'package:user_directory_app/features/users_list/presentation/widgets/error_view.dart';
import 'package:user_directory_app/features/users_list/presentation/widgets/loading_indicator.dart';
import 'package:user_directory_app/features/users_list/presentation/widgets/user_list_item.dart';

import '../../domain/entities/user_entity.dart';
import '../widgets/search_bar.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Directory', style: TextStyle(color: Colors.black)),
      ),
      body: BlocBuilder<UsersListBloc, PagingState<int, UserEntity>>(
        builder: (context, state) {
          return Column(
            children: [
              CustomSearchBar(
                onSearch: (query) {
                  BlocProvider.of<UsersListBloc>(context).add(
                    GetUsersListFirstPage(
                      params: GetUsersListParams(query: query),
                    ),
                  );
                },
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh:
                      () async => BlocProvider.of<UsersListBloc>(
                        context,
                      ).add(GetUsersListFirstPage()),
                  child: PagedListView(
                    state: state,
                    fetchNextPage:
                        () => BlocProvider.of<UsersListBloc>(
                          context,
                        ).add(GetUsersListNextPage()),
                    builderDelegate: PagedChildBuilderDelegate<UserEntity>(
                      itemBuilder:
                          (context, item, index) => UserListItem(
                            user: item,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.userDetails,
                                arguments: {'user': item},
                              );
                            },
                          ),
                      firstPageProgressIndicatorBuilder:
                          (context) => LoadingIndicator(),
                      firstPageErrorIndicatorBuilder:
                          (context) => ErrorView(
                            message: state.error.toString(),
                            onRetry:
                                () => BlocProvider.of<UsersListBloc>(
                                  context,
                                ).add(GetUsersListFirstPage()),
                          ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
