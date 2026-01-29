
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/pages/list_widgets_page.dart';
import 'package:flutter_labs/widgets/shared/app_bar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(15),
      child: ListWidgetsPage(),
    );
  }
}
