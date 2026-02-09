import 'package:flutter/material.dart';

class AppRecent extends StatefulWidget{
  const AppRecent ({super.key});

  @override
  State<AppRecent> createState() => _AppRecent();
}

class _AppRecent extends State<AppRecent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          color: Theme.of(context).colorScheme.tertiary,
          child: Text('')
      ),
    );
  }
}