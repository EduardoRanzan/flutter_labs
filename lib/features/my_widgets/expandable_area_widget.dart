import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/core/widgets/app_bar_widget.dart';

class ExpandableAreaWidget extends StatefulWidget{
  const ExpandableAreaWidget({super.key});

  @override
  State<ExpandableAreaWidget> createState() => _ExpandableAreaWidgetState();
}

class _ExpandableAreaWidgetState extends State<ExpandableAreaWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {

    return Card(
      child: InkWell(
        onTap: () {
          setState(() => expanded = !expanded);
        },
        child: Column(
          children: [
            ListTile(
              title: Text('Clique para expandir'),
              trailing: Icon(
                expanded ? Icons.expand_less : Icons.expand_more,
              ),
            ),
            AnimatedCrossFade(
              firstChild: SizedBox.shrink(),
              secondChild: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Descrição completa do item'),
              ),
              crossFadeState: expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 250),
            ),
          ],
        ),
      ),
    );
  }
}