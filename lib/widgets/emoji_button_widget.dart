import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/widgets/shared/app_bar_widget.dart';

class EmojiButton extends StatefulWidget{
  const EmojiButton({super.key});

  @override
  State<EmojiButton> createState() => _EmojiButtonState();
}

class _EmojiButtonState extends State<EmojiButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(

    );
  }
}