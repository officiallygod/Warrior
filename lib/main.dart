import 'package:flutter/material.dart';
import 'package:warrior/screens/intro_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warrior',
      theme: ThemeData(
        primaryColor: Color(0xFF564FF5),
        accentColor: Colors.purpleAccent,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}
