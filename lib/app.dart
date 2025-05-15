import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/app_themes.dart';
import 'core/di/service_locator.dart';
import 'features/users_list/presentation/bloc/users_list_bloc.dart';
import 'features/users_list/presentation/bloc/users_list_event.dart';
import 'features/users_list/presentation/pages/user_details_page.dart';
import 'features/users_list/presentation/pages/users_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users Directory',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: (settings) {
        Map<String, dynamic> args = {};
        if (settings.arguments != null) {
          args = settings.arguments as Map<String, dynamic>;
        }

        switch (settings.name) {
          case AppRoutes.home:
            return MaterialPageRoute(
              builder:
                  (context) => BlocProvider<UsersListBloc>(
                    create:
                        (BuildContext context) =>
                            serviceLocator()..add(GetUsersListFirstPage()),
                    child: const UsersListPage(),
                  ),
            );
          case AppRoutes.userDetails:
            return MaterialPageRoute(
              builder: (context) => UserDetailsPage(user: args['user']),
            );
          default:
            return null;
        }
      },
    );
  }
}
