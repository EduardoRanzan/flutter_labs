import 'package:flutter/material.dart';
import 'package:flutter_labs/core/storage/secure_storage.dart';
import 'package:flutter_labs/core/widgets/app_text.dart';
import 'package:flutter_labs/features/dashboard/presentation/app_dashboard.dart';
import 'package:flutter_labs/features/recent/presentation/app_recent.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _secureStorage = SecureStorage();
  String? _userName;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final name = await _secureStorage.getUserName();

    if(!mounted) return;

    setState(() {
      _userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 5), child: _buildBody())),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: _buildWelcome()
        ),
        Expanded(
          flex: 7,
          child: AppDashboard(),
        ),
        Expanded(
          flex: 4,
          child: AppRecent(),
        ),
      ],
    );
  }

  Widget _buildWelcome() {
    return Center(child: AppText.title(context, '${AppLocalizations.of(context)?.welcome}, $_userName',));
  }
}
