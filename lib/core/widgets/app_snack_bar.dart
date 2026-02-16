import 'package:flutter/material.dart';

class AppSnackBar  {

  static SnackBar AppSnackBarError(
      BuildContext context,
      String message,
      {bool? showCloseIcon,}
  ) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.error,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: showCloseIcon,
    );
  }

  static SnackBar AppSnackBarSucess(
      BuildContext context,
      String message,
      {bool? showCloseIcon,}
      ) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: showCloseIcon,
    );
  }
}

