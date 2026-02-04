import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_labs/features/auth/presentation/auth_page.dart';
import 'package:flutter_labs/features/presentation/home_page.dart';
import 'package:flutter_labs/features/splash/presentation/splash_page.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      routes: {
        '/splash': (_) => const SplashPage(),
        '/home': (_) => const MyHomePage(),
        '/login': (_) => const AuthPage(),
      },
      initialRoute: '/splash',
    );
  }
}