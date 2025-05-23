import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/di/service_locator.dart' as di;
import 'package:movie_app/src/core/routes/routes.dart';
import 'package:movie_app/src/core/routes/routes_name.dart';
import 'package:movie_app/src/features/auth_module/domain/usecases/login_use_case.dart';
import 'package:movie_app/src/features/auth_module/domain/usecases/sign_up_use_case.dart';
import 'package:movie_app/src/features/auth_module/presentation/bloc/auth_bloc.dart';
import 'package:movie_app/src/features/home_module/home/domain/use_case/get_tv_show_use_case.dart';
import 'package:movie_app/src/features/home_module/home/presentation/bloc/movies_bloc.dart';
import 'package:movie_app/src/features/todo/presentation/bloc/todo_bloc.dart';

void main() {
  di.init();
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
          create: (context) => AuthBloc(
            di.sl<LoginUseCase>(),
            di.sl<SignUpUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => TvShowsBloc(di.sl<GetTvShowsUseCase>()),
        ),
        BlocProvider(
          create: (context) => TodoBloc(
            di.sl(),
            di.sl(),
            di.sl(),
            di.sl(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        navigatorKey: navigatorKey,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
