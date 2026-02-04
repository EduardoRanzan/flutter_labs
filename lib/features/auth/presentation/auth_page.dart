import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget{
  const AuthPage ({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsetsGeometry.directional(
          start: 20,
          end: 20,
          top: 100,
          bottom: 100),
        child: Card(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _buildCardContext()
          ),
        )
      ),
    );
  }

  Widget _buildCardContext() {
    return Text("aaaaaaaa");
  }
}