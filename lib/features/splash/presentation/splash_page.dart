import 'package:flutter/material.dart';
import 'package:flutter_labs/core/storage/secure_storage.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final token = await _secureStorage.getToken();

    if (!mounted) return;

    Navigator.pushReplacementNamed(
        context,
        token != null ? '/home' : '/login'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}