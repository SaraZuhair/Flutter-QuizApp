import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sarazuhair_quizapp/page2.dart';

class firstscreen extends StatefulWidget {

  const firstscreen({Key? key}) : super(key: key);

  @override
  _firstscreenState createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  _firstscreenState();

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => categories())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Center(



          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.indigo,
                    Colors.blue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 200),
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height/500,
              width:  MediaQuery.of(context).size.width/500,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/brain-home.png'),
                  )),

              child:
                   Container(

                    alignment: Alignment.center,
                    // margin: new EdgeInsets.only(top: 290),
                    child: Stack(
                      children: [
                        Container(

                            width: 1000,
                            height: 10000,
                            alignment: Alignment.center,
                            padding:  const EdgeInsets.only(top: 140, left: 50 , right: 50),
                            child: Stack(
                              children: const [
                                LinearProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ],
                            )),
                        Container(
                          padding: const EdgeInsets.only(top: 70),
                          alignment: Alignment.center,
                          child: const Text(
                            'SmartQuiz',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

              //   Container(
              //
              //     alignment: Alignment.bottomCenter,
              //     margin: new EdgeInsets.only(top: 200),
              //     padding: new EdgeInsets.only(top: 100),
              //
              //     child: Stack(
              //       children: [
              //
              //         Positioned(
              //          right: 10,
              //           bottom: -30,
              //           child:
              //         const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation <Color> (Colors.white),),
              //         ),
              // ],
              //     ),
              //
              //     ),

              // ]
            ),
          )
        ),
      );
    }
  }
