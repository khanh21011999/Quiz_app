import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  //Set time to move to other screen
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=>homepage()
      ));
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.greenAccent,
          body: Center(
            child: Text(
              "Quiz Time!",
              style: TextStyle(
                fontSize: 60.0,
                fontFamily: 'Google',
              ),
            ),
          )
      );
    }
  }
