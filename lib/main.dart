import 'package:flutter/material.dart';
import 'package:quiz_app/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: "Google"
      ),
      home: splashscreen(),
    );
  }
}