import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sarazuhair_quizapp/result.dart';

class getinfo extends StatelessWidget {
  bool isDarkModeEnabled = false;
  // getinfo({Key? key}) : super(key: key);

  // String langname = '';
  // getinfo(this.langname);

  String? langname;
  getinfo({this.langname});
  String assettoload = '';

  String setasset() {
    if (langname == "Flutter") {
      return "assets/flutter.json";
    } else if (langname == "C++") {
      return "assets/c++.json";
    } else if (langname == "Java") {
      return "assets/java.json";
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(
          setasset(),
        ),
        builder: (context, AsyncSnapshot<String> snapshot) {
          List data = json.decode(snapshot.data.toString());

          if (data.isEmpty) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'Loading',
                ),
              ),
            );
          } else {
            return quizpage(data: data);
          }
        });
  }
}

class quizpage extends StatefulWidget {
  final data;

  const quizpage({Key? key, @required this.data}) : super(key: key);

  @override
  _quizpageState createState() => _quizpageState(data);
}

class _quizpageState extends State<quizpage> {
  _quizpageState(data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                SafeArea(
                  child: Container(

                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.data?[0][i.toString()].toString() ?? "null",
                      style: const TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.indigo,
                Colors.blue,
              ]
              ),
                  ),
                ),
                )],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    optionbutton("a"),
                    optionbutton("b"),
                    optionbutton("c"),
                    optionbutton("d"),
                  ],
                ),


            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.indigo,
                    Colors.blue,
                  ]
                  ),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.topCenter,
              child: Center(
                child: Text(
                  showtime,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Times New Roman',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget optionbutton(String k) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: MaterialButton(
        onPressed: () => check(k),
        child: Text(
          widget.data?[1][i.toString()][k].toString() ?? "null",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),

        color: button[k],
        minWidth: 200,
        height: 45,
        splashColor: Colors.indigo,
        highlightColor: Colors.indigo,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  int mark = 0;
  Color show = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;

  Map<String, Color> button = {
    "a": Colors.blue,
    "b": Colors.blue,
    "c": Colors.blue,
    "d": Colors.blue,
  };

  int i = 1;
  int time = 30;
  String showtime = "30";

  bool canceltimer = false;

  void initState() {
    starttimer();
    super.initState();
  }

  void starttimer() async {
    const onesec = (Duration(seconds: 1));
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (time < 1) {
          next();
          // t.cancel();
          setState(() {
            time = 30;
          });
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          time = time - 1;
        }

        showtime = time.toString();
      });
    });
  }

  void check(String k) {
    if (widget.data[2][i.toString()] == widget.data[1][i.toString()][k]) {
      mark += 5;
      show = right;
    } else {
      show = wrong;
    }
    setState(() {
      button[k] = show;
    });

    Timer(const Duration(seconds: 2), next);
  }

  void next() {
    canceltimer = false;
    time = 30;

    setState(() {
      if (i < 10) {
        i++;
      } else {
        canceltimer = true;
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => result(mark: mark),
        ));
      }

      button["a"] = Colors.blue;
      button["b"] = Colors.blue;
      button["c"] = Colors.blue;
      button["d"] = Colors.blue;
    });
  }
}
