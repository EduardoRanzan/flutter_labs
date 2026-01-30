import 'package:flutter/material.dart';
import 'package:flutter_labs/widgets/shared/app_bar_widget.dart';

class EmojiButton extends StatefulWidget{
  const EmojiButton({super.key});

  @override
  State<EmojiButton> createState() => _EmojiButtonState();
}

class _EmojiButtonState extends State<EmojiButton> {
  IconData? _iconPressed;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Botão de emoji',),
      body: Padding(
          padding: const EdgeInsetsGeometry.all(15),
          child: Center(
              child: _buildBody(),
          )
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      spacing: 50,
      children: [
        Text(
          'Esse foi o primeiro widget feito nesse laboratório, aqui basicamente você seleciona seu grau de satisfação, essa é a ideia:',
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.justify,
        ),
        Row(
          spacing: 10,
          children: [
        Expanded(
            child: EmojiButtonBuild(
              icon: Icons.sentiment_satisfied,
              isSelected: _iconPressed == Icons.sentiment_satisfied,
              color: Colors.green,
              onTap: () => _onEmojiTap(Icons.sentiment_satisfied),
            )
        ),
        Expanded(
            child: EmojiButtonBuild(
              icon: Icons.sentiment_neutral,
              isSelected: _iconPressed == Icons.sentiment_neutral,
              color: Colors.yellow,
              onTap: () => _onEmojiTap(Icons.sentiment_neutral),
            )
        ),
        Expanded(
            child: EmojiButtonBuild(
              icon: Icons.sentiment_dissatisfied,
              isSelected: _iconPressed == Icons.sentiment_dissatisfied,
              color: Colors.red,
              onTap: () => _onEmojiTap(Icons.sentiment_dissatisfied),
            )
        ),
      ],
        )
      ]
    );
  }

  void _onEmojiTap(IconData icon) {
    setState(() {
      if (_iconPressed == icon) {
        _iconPressed = null;
      } else {
        _iconPressed = icon;
      }
    });
  }
}

class EmojiButtonBuild extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const EmojiButtonBuild({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.grey,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ]
              : [],
        ),
        child: Icon(
          icon,
          size: 40,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
