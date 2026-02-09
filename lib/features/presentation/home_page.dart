import 'package:flutter/material.dart';
import 'package:flutter_labs/features/dashboard/presentation/app_dashboard.dart';
import 'package:flutter_labs/features/recent/presentation/app_recent.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: AppDashboard(),
        ),
        Expanded(
          flex: 1,
          child: AppRecent(),
        ),
      ],
    );
  }
}
