import 'package:flutter/material.dart';
import 'package:flutter_labs/core/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter_labs/features/my_widgets/my_widgets_page.dart';
import 'package:flutter_labs/features/presentation/home_page.dart';
import 'package:flutter_labs/features/profile/presentation/profile_page.dart';

class MainHomePage extends StatefulWidget{
  const MainHomePage ({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    MyHomePage(),
    MyWidgetsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }
}