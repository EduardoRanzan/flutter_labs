import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/core/storage/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SecureStorage _secureStorage;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _secureStorage = SecureStorage(
        const FlutterSecureStorage()
    );
    _getToken();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _goTo();
    });
  }

  Future<void> _getToken() async {
    final token = await _secureStorage.getToken();
    if (token != null) {
      isLoggedIn = true;
    }
  }

  Future<void> _goTo() async{
    if (!mounted) return;

    Navigator.pushReplacementNamed(
        context,
        isLoggedIn ? '/home' : '/login'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}