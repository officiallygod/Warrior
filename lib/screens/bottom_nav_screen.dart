import 'package:flutter/material.dart';
import 'package:warrior/screens/info_screen.dart';
import 'package:warrior/screens/stats_screen.dart';

import 'about_corona.dart';
import 'main_default_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    MainDefaultScreen(),
    StatsScreen(),
    InfoScreen(),
    AboutCorona(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black12,
        elevation: 0.0,
        currentIndex: _currentIndex,
        items: [
          Icons.home,
          Icons.insert_chart,
          Icons.event_note,
          Icons.info,
        ]
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                BottomNavigationBarItem(
                  title: Text(''),
                  icon: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7.0,
                      horizontal: 14.0,
                    ),
                    decoration: BoxDecoration(
                      color: _currentIndex == key
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Icon(value),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
