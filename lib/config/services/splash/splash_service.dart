import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movie_app/config/routes/routes_name.dart';

class SplashService {
  static void login(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.login,
          (route) => false,
        );
      },
    );
  }
}
