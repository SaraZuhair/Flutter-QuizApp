import 'package:flutter/material.dart';
import 'package:sarazuhair_quizapp/page2.dart';
import 'package:flutter/cupertino.dart';

class result extends StatefulWidget {
  bool isDarkModeEnabled = false;
  int mark = 0;
  String message = "";
  String imagee = "";

  // result({Key? key}) : super(key: key);

  result({
    Key? key,
    required this.mark,
  }) : super(key: key);

  @override
  _resultState createState() =>
      _resultState(mark, imagee, message, isDarkModeEnabled);
}

class _resultState extends State<result> {
  bool isDarkModeEnabled = false;
  int mark = 0;
  String message = "";
  String imagee = "";
  _resultState(this.mark, this.imagee, this.message, this.isDarkModeEnabled);

  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }

  List<String> images = [
    "assets/image/did well-quiz.png",
    "assets/image/high-mark.png",
    "assets/image/did bad-quiz.png",
  ];

  @override
  void initState() {
    if (mark < 20) {
      imagee = images[2];
      message = "You Should Try Hard..\n" + "You Scored $mark" + " " + "Marks";
    } else if (mark < 35) {
      imagee = images[1];
      message = "You Can Do Better..\n" + "You Scored $mark"+" " + "Marks";
    } else {
      imagee = images[0];
      message = "Congrats!" + " " + "You Did Very Well\n" + "You Scored $mark" + " "+"Marks!";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Result Page',
          style: TextStyle(color: Colors.white),
        ),

        // actions: [
        //    changeThemeButtonWidget(),
        // ],
      ),




      body: Container(
        // upper container

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

      padding: const EdgeInsets.only(top: 40,bottom: 40, left: 20,right: 20),
         height: 600,

         child: Container(              //grey

            decoration: BoxDecoration(
              color: Colors.white60,
              // gradient: const LinearGradient(
              //   colors: [
              //     Colors.white38,
              //     Colors.white,
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              // ),


              borderRadius: BorderRadius.circular(100),
            ),


            margin: const EdgeInsets.only(bottom: 00),//body
          padding: const EdgeInsets.only(bottom: 8, left: 10, right: 10, top: 10),
            height: 450,
            child:
            // Container(  //the circular one holding pic mesg and gif
            //   // padding: EdgeInsets.all(15),
            //
            //
            //
            //
            //   child: Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: Column(children: [
            //       Expanded(
            //         flex: 6,
            //         child: Column(
            //           children: [
                        Stack(
                          children:[
                           Container(

                            alignment: Alignment.center,
                            height: 300,
                            child: ClipRect(
                              child: Image(
                                alignment: Alignment.center,
                                image: AssetImage(
                                  imagee,
                                ),
                              ),
                            ),
                          ),

                            Container(
                             margin: const EdgeInsets.only(top: 320),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    message,
                                    style: const TextStyle(
                                        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),

                                   textAlign: TextAlign.center,
                                  ),
                                ],
                              )

                            ),





                            Container(
                              padding: const EdgeInsets.only(left: 50),
                                margin: const EdgeInsets.only(top: 380),
                                child: Row(

                                  children: const [
                                    Text(
                                      'You attempt',
                                      style: TextStyle(
                                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ],
                                )
                            ),

                            Container(
                                padding: const EdgeInsets.only(left: 130),
                                margin: const EdgeInsets.only(top: 380),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      '10 Questions!',
                                      style: TextStyle(
                                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                                    ),
                                  ],
                                )
                            ),



                            Container(
                                padding: const EdgeInsets.only(right: 110),
                                margin: const EdgeInsets.only(top: 420),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Test',
                                      style: TextStyle(
                                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                            ),



                            Container(
                                padding: const EdgeInsets.only(left: 70),
                                margin: const EdgeInsets.only(top: 420),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'COMPLETED',
                                      style: TextStyle(
                                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                            ),



                            Container(
                                padding: const EdgeInsets.only(left: 20),
                                margin: const EdgeInsets.only(top: 450),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Successfully!',
                                      style: TextStyle(
                                          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                                    textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                            )

                              ],
                            ),
                          ),
                        ),
                      );








          // Column(children: [
          //   Expanded(
          //       flex: 4,
          //       child: Stack(
          //         children: [
          //           Container(
          //             alignment: Alignment.center,
          //             padding: EdgeInsets.only(top: 400),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
                          // OutlinedButton(onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>firstscreen()));}, child: const Text('Go Back', style: TextStyle(fontSize: 18),)),

                          // ElevatedButton(
                          //     onPressed: (){},
                          //     child: Text(
                          //       'Go Back'
                          //     ),
                          //   style: ButtonStyle(
                          //     backgroundColor:MaterialStateProperty.all<Color>(Colors.white) ,
                          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          //            RoundedRectangleBorder(
                          //               borderRadius: BorderRadius.all(Radius.circular(100)),
                          //
                          //           ),
                          //
                          //       )
                          //   ),
                          // ),

                          // RawMaterialButton (
                          //   onPressed: ()  {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> categories()
                          //           ),
                          //       );
                          //    },
                          //   elevation: 0.0,
                          //   fillColor: Colors.white,
                          //   // child: const Text('Back', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                          //   padding: const EdgeInsets.all(15.0),
                          //   shape: const CircleBorder(),
                          //
                          //        ),
                    //     ],
                    //   ),
                    // );
          //         ],
          //       )),
          // ]),




          // Padding(
          //   padding: const EdgeInsets.only(bottom: 10.0, top: 100, left: 20),
          //   child: Container(
          //     width: 100,
          //     margin: const EdgeInsets.only(top: 300, left: 140, bottom: 20),
          //     decoration: const BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage('assets/image/lamp-unscreen.gif'))),
          //
          //   ),
          // ),

    //   ),
    // );
  }
}
