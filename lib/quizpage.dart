import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class getjson extends StatelessWidget {
  // accept the langname as a parameter

  @override
  Widget build(BuildContext context) {
    // this function is called before the build so that
    // the string assettoload is avialable to the DefaultAssetBuilder
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString("quiz/python.json"),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "error, but still loading...",
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  var mydata
  @override
  _quizpageState createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  Widget choiceButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Option1",
          style: TextStyle(
            fontSize: 20,
          ),
          maxLines: 2,
        ),
        color: Colors.green,
        splashColor: Colors.greenAccent[500],
        highlightColor: Colors.greenAccent[500],
        minWidth: 400,
        height: 80,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(

                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      "Ngay sau khi bệnh nhân 1883 nhiễm SARS-CoV-2 được công bố, cơ quan chức năng đã khẩn trương điều tra truy vết, bước đầu xác định và lấy mẫu xét nghiệm 37 trường hợp tiếp xúc trực tiếp",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        choiceButton(),
                        choiceButton(),
                        choiceButton(),
                        choiceButton(),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Text(
                        "30",
                        style: TextStyle(
                            fontSize: 40
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                    ),
                  )),
            ],
          ),
        ),
        onWillPop: () {
          return showDialog(
              context: context,
              builder:(context)=> AlertDialog(
                  title: Text(
                    "Quizz"
                  ),
                content: Text(
                  "Hey, you are not finished yet, keep going ^^"
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed:(){
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "okey, let do it"
                      ))
                ],
              ));
        }
    );
  }
}
