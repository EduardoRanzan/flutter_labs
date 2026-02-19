import 'package:flutter/material.dart';
import 'package:flutter_labs/features/auth/services/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final hasValidSession = await _authService.hasValidSession();

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      hasValidSession ? '/home' : '/login',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
