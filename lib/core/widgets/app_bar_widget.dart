import 'package:flutter/material.dart';

class AppBarWidget {

  static PreferredSizeWidget appBar(
      BuildContext context,
      {
        String? title,
        List<Widget>? leading,
        List<Widget>? actions,
        Widget? flexibleSpace,
        bool? centerTitle,
      }
      ) {
    return AppBar(
      title: title != null ? Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ) : null,
      leading: leading != null ? Row(
        children: leading,
      ) : null,
      actions: actions,
      flexibleSpace: flexibleSpace,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}