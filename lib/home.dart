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
          20.0,
        ),
      child: InkWell(
        child: Material(
          elevation: 10.0,
          borderRadius:BorderRadius.circular(30.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0
                  ),
                  child: Material(
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
      backgroundColor: Colors.,
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
