import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _goTo();
    });
  }

  Future<void> _goTo() async{
    // TODO: imp share preferences token
    final bool isLoggedIn = false;

    if (!mounted) return;

    Navigator.pushReplacementNamed(
        context,
        isLoggedIn ? '/home' : '/login'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Theme.of(context).colorScheme.secondary,
    );
  }
}