import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const AppText(
      this.text, {
        super.key,
        this.style,
      });

  factory AppText.title(BuildContext context, String text) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18
      ),
    );
  }

  factory AppText.titleOnSecondary(BuildContext context, String text) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }

  factory AppText.titleInverse(BuildContext context, String text) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  factory AppText.body(BuildContext context, String text) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15
      ),
    );
  }

  factory AppText.bodyInverse(BuildContext context, String text) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
