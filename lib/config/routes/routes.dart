import 'package:flutter/material.dart';
import 'package:movie_app/config/routes/routes_name.dart';
import 'package:movie_app/view/splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
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
