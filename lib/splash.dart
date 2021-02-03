import 'package:flutter/material.dart';
class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text(
          "Quiz",
          style: TextStyle(
            fontSize: 60.0,
            fontFamily:'P',
          ),
        ),
      )
    );
  }
}
