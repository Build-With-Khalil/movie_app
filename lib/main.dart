import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/routes/routes.dart';
import 'package:movie_app/src/core/routes/routes_name.dart';
import 'package:movie_app/src/features/auth_module/login/presentation/bloc/login_bloc.dart';
import 'package:movie_app/src/features/home_module/home/data/repositories/movies_repositories.dart';
import 'package:movie_app/src/features/home_module/home/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/src/features/todo/presentation/bloc/todo_bloc.dart';

void main() {
  runApp(const MyApp());
}

// Navigation Key

var navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => MoviesBloc(MoviesRepository()),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
