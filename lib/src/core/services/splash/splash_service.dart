import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../routes/routes_name.dart';
import '../storage/token_storage.dart';

class SplashService {
  static void login(BuildContext context) async {
    String? token = await TokenStorage.getToken();

    Timer(
      const Duration(seconds: 3),
      () {
        if (token != null && token.isNotEmpty) {
          /// If token exists, navigate to home screen
          Navigator.pushNamed(context, RoutesName.login);
        } else {
          /// If no token exists, navigate to login screen
          Navigator.pushNamed(context, RoutesName.login);
        }
      },
    );
  }
}
