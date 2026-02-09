
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/core/widgets/app_bar_widget.dart';
import 'package:flutter_labs/features/my_widgets/list_widgets_page.dart';

class MyWidgetsPage extends StatefulWidget {
  const MyWidgetsPage({super.key});

  @override
  State<MyWidgetsPage> createState() => _MyWidgetsPageState();
}

class _MyWidgetsPageState extends State<MyWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Text(
              'Lista de Widgets que criei para aprendizado:',
              textAlign: TextAlign.justify,
            ),
            Expanded(
                child: ListWidgetsPage()
            )
          ]
      ),
    );
  }
}
