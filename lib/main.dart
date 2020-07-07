import 'package:flutter/material.dart';

import 'screens/bmi_calaculation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        accentColor: Colors.deepPurple,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.cyan,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            color: Colors.grey.withAlpha(150),
            fontSize: 15,

          ),
          headline3: TextStyle(
            color: Colors.purple,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: BMIClaculationScreen(),
    );
  }
}
