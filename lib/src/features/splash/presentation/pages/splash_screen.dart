import 'package:flutter/material.dart';

import '../../../../core/services/splash/splash_service.dart';
import '../../../../core/utils/theme/theme_instances.dart';

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
