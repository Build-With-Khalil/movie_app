import 'package:flutter/material.dart';
import 'package:movie_app/config/services/splash/splash_service.dart';
import 'package:movie_app/config/theme/theme_instances.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        SplashService.login(context);
      },
    );
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: ThemeInstance(context).displayLarge,
        ),
      ),
    );
  }
}
