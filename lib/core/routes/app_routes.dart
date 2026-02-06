import 'package:flutter/cupertino.dart';
import 'package:flutter_labs/features/auth/presentation/auth_page.dart';
import 'package:flutter_labs/features/my_widgets/my_widgets_page.dart';
import 'package:flutter_labs/features/presentation/main_home_page.dart';
import 'package:flutter_labs/features/splash/presentation/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> initRoutes() {
    return {
      '/splash': (context) => const SplashPage(),
      '/home': (context) => const MainHomePage(),
      '/login': (context) => const AuthPage(),
      '/mywidgets': (context) => const MyWidgetsPage(),
    };
  }
}