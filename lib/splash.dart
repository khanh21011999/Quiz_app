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
          body: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops:[
                          0.1,
                          0.4,
                          0.7,
                          0.9,
                        ],
                        colors: [
                          Colors.blue,
                          Colors.red,
                          Colors.indigoAccent,
                          Colors.greenAccent,
                        ])),
                child: Center(
                  child: Text(
                    'Quiz Time!',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontFamily: "Google",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )));
    }
  }
