import 'package:flutter/material.dart';
import 'package:movie_app/src/core/routes/routes_name.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/pages/login_screen.dart';
import 'package:movie_app/src/features/home_module/home/presentation/pages/home_screen.dart';

import '../../features/splash/presentation/pages/splash_screen.dart';
import '../../features/todo/presentation/pages/add_todo/add_todo_view.dart';
import '../../features/todo/presentation/pages/todo/todo_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.addTodoView:
        return MaterialPageRoute(
          builder: (context) => const AddTodoView(),
        );
      case RoutesName.todoView:
        return MaterialPageRoute(
          builder: (context) => const TodoView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
