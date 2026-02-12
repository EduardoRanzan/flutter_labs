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
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,

          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
          unselectedItemColor: Theme.of(context).colorScheme.primary,

          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            size: 35,
          ),

          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context)?.home ?? '',
              activeIcon: Icon(Icons.home_outlined)
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2),
              label: AppLocalizations.of(context)?.master_data ?? '',
              activeIcon: Icon(Icons.inventory_2_outlined),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppLocalizations.of(context)?.profile ?? '',
              activeIcon: Icon(Icons.person_outlined),
            ),
          ],
        )
      )
    );
  }
}
