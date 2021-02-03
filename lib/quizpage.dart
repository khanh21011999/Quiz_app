import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/result.dart';

class getjson extends StatelessWidget {
  // accept the langname as a parameter

  @override
  Widget build(BuildContext context) {
    // this function is called before the build so that
    // the string assettoload is avialable to the DefaultAssetBuilder
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("quiz/python.json"),
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
  var mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);

  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  var mydata;
  Color colorToShow = Colors.green;
  Color right = Colors.blue;
  Color wrong = Colors.redAccent;
  int mark = 0;
  int i = 1;
  int time = 30;
  String showtimer = "30";
  Map<String, Color> buttonColor = {
    "a": Colors.green,
    "b": Colors.green,
    "c": Colors.green,
    "d": Colors.green,
  };
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (time < 1) {
          t.cancel();
          nextQues();
        } else if(canceltimer==true){
          t.cancel();
        }
        else {
          time = time - 1;

        }
        showtimer = time.toString();
      });
    });
  }

  void nextQues() {
    canceltimer=false;
    time=30;
    setState(() {
      if (i < 5) {
        i++;
      } else {
       Navigator.of(context).pushReplacement(MaterialPageRoute(
           builder: (context)=>result(),
       ));
      }
      buttonColor["a"] = Colors.green;
      buttonColor["b"] = Colors.green;
      buttonColor["c"] = Colors.green;
      buttonColor["d"] = Colors.green;
    });
    startTimer();
  }
  bool canceltimer=false;
  void checkanswer(String answer) {
    if (mydata[2]["1"] == mydata[1]["1"][answer]) {
      mark = mark + 1;
      colorToShow = right;
    } else {
      colorToShow = wrong;
    }
    setState(() {
      buttonColor[answer] = colorToShow;
      canceltimer =true;
    });
    Timer(Duration(seconds: 1), nextQues);
  }

  _quizpageState(this.mydata);

  Widget choiceButton(String answer) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(answer),
        child: Text(
          mydata[1][i.toString()][answer],
          style: TextStyle(
            fontSize: 20,
          ),
          maxLines: 2,
        ),
        color: buttonColor[answer],
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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
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
                      mydata[0][i.toString()],
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        choiceButton('a'),
                        choiceButton('b'),
                        choiceButton('c'),
                        choiceButton('d'),
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
                        showtimer,
                        style: TextStyle(fontSize: 40),
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
              builder: (context) => AlertDialog(
                    title: Text("Quizz"),
                    content:
                        Text("Hey, you are not finished yet, keep going ^^"),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("okey, let do it"))
                    ],
                  ));
        });
  }
}
