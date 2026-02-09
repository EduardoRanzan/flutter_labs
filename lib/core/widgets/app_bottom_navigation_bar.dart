import 'package:flutter/material.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      showUnselectedLabels: true,
      unselectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.outline,
        size: 30,
      ),
      unselectedItemColor: Theme.of(context).colorScheme.outline,

      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onPrimary,
        size: 35,
        shadows: [
          Shadow(
            offset: Offset(0, 1),
            blurRadius: 1,
          ),
          Shadow(
            offset: Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),

      backgroundColor: Theme.of(context).colorScheme.primary,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: AppLocalizations.of(context)?.home ?? '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.line_weight_sharp),
          label: AppLocalizations.of(context)?.widgets ?? '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppLocalizations.of(context)?.profile ?? '',
        ),
      ],
    );
  }
}
