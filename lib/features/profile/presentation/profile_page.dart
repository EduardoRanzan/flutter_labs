import 'package:flutter/material.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage ({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsetsGeometry.fromLTRB(0, 10, 0, 10), child: _buildBody())),
    );
  }
  
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          flex: 12,
          child: Card(),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {Navigator.pushNamed(context, '/login');},
              child: Text(AppLocalizations.of(context)?.logout ?? '')
            )
          )
        )
      ],
    );
  }
}