import 'package:flutter/material.dart';
import 'package:flutter_labs/core/widgets/app_bar_widget.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage ({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.appBar(context),
    );
  }
}