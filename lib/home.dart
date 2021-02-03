import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Widget customcard(){
    return Padding(
        padding: EdgeInsets.all(
          30.0,
        ),
      child: InkWell(
        onTap: (){
          debugPrint("Tapped");
        },
        child: Material(
          color: Colors.lightGreen,
          elevation: 30.0,

          borderRadius:BorderRadius.circular(37.0),
          child: Container(
            child: Column(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0
                  ),
                  child: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(
                            "images/py.png"
                          ),
                        ),
                      )
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Python",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Let's test your Python skill via this quiz, just spend less than 5 mins !",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Simple Quiz App",
        ),
      ),
      body:ListView(
         children: <Widget>[
           //store all the card
           customcard(),
         ],
      )
    );
  }
}
