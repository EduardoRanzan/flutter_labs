import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          _headers(),
          _actions(),
          _content(),
        ],
      )
    );
  }

  Widget _headers() {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Text('data')),
    );
  }

  Widget _actions() {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Text('data')),
    );
  }

  Widget _content() {
    return Card(
      color: Theme.of(context).colorScheme.tertiary,
      child: SizedBox(
          width: double.infinity,
          height: 300,
          child: Text('data')),
    );
  }
}
