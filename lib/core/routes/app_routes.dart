import 'package:flutter/cupertino.dart';
import 'package:flutter_labs/features/auth/presentation/auth_page.dart';
import 'package:flutter_labs/features/presentation/home_page.dart';
import 'package:flutter_labs/features/splash/presentation/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> initRoutes() {
    return {
      '/splash': (context) => const SplashPage(),
      '/home': (context) => const MyHomePage(),
      '/login': (context) => const AuthPage(),
    };
  }
}