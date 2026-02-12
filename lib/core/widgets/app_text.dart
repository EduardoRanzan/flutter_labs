import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const AppText(
      this.text, {
        super.key,
        this.style,
        this.textAlign
      });

  factory AppText.title(BuildContext context, String text, {TextAlign? textAlign}) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18
      ),
      textAlign: textAlign,
    );
  }

  factory AppText.titleOnSecondary(BuildContext context, String text, {TextAlign? textAlign}) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      textAlign: textAlign,
    );
  }

  factory AppText.titleInverse(BuildContext context, String text, {TextAlign? textAlign}) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        color: Theme.of(context).colorScheme.surface,
      ),
      textAlign: textAlign,
    );
  }

  factory AppText.body(BuildContext context, String text, {TextAlign? textAlign}) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15
      ),
      textAlign: textAlign,
    );
  }

  factory AppText.bodyInverse(BuildContext context, String text, {TextAlign? textAlign}) {
    return AppText(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 15,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        color: Theme.of(context).colorScheme.surface,
      ),
      textAlign: textAlign,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style, textAlign: textAlign,);
  }
}
