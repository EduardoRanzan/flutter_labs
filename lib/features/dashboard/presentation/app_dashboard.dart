import 'package:flutter/material.dart';

class AppDashboard extends StatefulWidget{
  const AppDashboard ({super.key});

  @override
  State<AppDashboard> createState() => _AppDashboard();
}

class _AppDashboard extends State<AppDashboard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Text('')
      ),
    );
  }
}