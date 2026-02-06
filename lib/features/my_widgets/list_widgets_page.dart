import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/data/widgets_list.dart';

class ListWidgetsPage extends StatefulWidget{
  const ListWidgetsPage({super.key});

  @override
  State<ListWidgetsPage> createState() => _ListWidgetsPageState();
}

class _ListWidgetsPageState extends State<ListWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    final widgets = WidgetsList.items;

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return Material(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.2),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => widgets[index].page));
              },
              child: Container(
                child: Center(
                    child: Text(widgets[index].title)
                ),
              )
            )
          );
        },
    );
  }
}