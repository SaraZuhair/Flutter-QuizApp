import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:sarazuhair_quizapp/provider/themeprovider.dart';
import 'package:sarazuhair_quizapp/quizpage.dart';
import 'package:easy_localization/easy_localization.dart';

class categories extends StatefulWidget {
  categories({Key? key}) : super(key: key);

  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List<String> image = [
    'assets/image/fnew.jpg',
    'assets/image/cnew.png',
    'assets/image/jnew.jpg',
  ];

  List<String> desc = [
    'Flutter is a free and open-source mobile UI framework created by Google '
        'and released in May 2017. it allows you to create a native '
        'mobile application with only one codebase.',

    'C++ is a general-purpose programming language created '
        'by Bjarne Stroustrup as an extension of the C programming language,'
        ' or "C with Classes".',

    'Java is an object-oriented programming language that produces software for multiple platforms. When a programmer writes a Java application,'
        ' the compiled code (known as bytecode) runs on most operating systems (OS), '
        'including Windows, Linux and Mac OS.',

  ];

  // String get langname => langname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[

          Container(
            margin: const EdgeInsets.only(bottom: 30),
            height: 100,
            width: 500,
            padding:  const EdgeInsets.only(top: 25),
            child: Stack(children: [


              // Positioned(
              //   right: 10,
              //   child: InkWell(
              //       onTap: () {
              //         final themeChanger =
              //         Provider.of<ThemeChanger>(context, listen: false);
              //         themeChanger.setTheme();
              //       },
              //       child: const Icon(
              //         Icons.color_lens,
              //         color: Colors.white,
              //         size: 34,
              //         )
              //       ),
              //     ),


              Padding(
                padding: const EdgeInsets.only(left: 130,top: 10,right: 100),
                child: Text(
                  "SmartQuiz".tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: InkWell(
                  onTap: () {
                    if (EasyLocalization.of(context)!.locale == const Locale('en', 'US')) {
                      EasyLocalization.of(context)!.setLocale(const Locale("ar", "IQ"));
                    } else {
                      EasyLocalization.of(context)!.setLocale(const Locale("en", "US"));
                    }
                  },
                  child:Row(
                    children: [
                      const Icon(Icons.language, color: Colors.white),

                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      // padding: EdgeInsets.only(left: 30 , right: 30),
                      height: 30,
                      color: Colors.white60,
                      width: 2,

                    ),

                      InkWell(
                          onTap: () {
                            final themeChanger =
                            Provider.of<ThemeChanger>(context, listen: false);
                            themeChanger.setTheme(

                            );
                          },
                          child: const Icon(
                            Icons.color_lens,
                            color: Colors.white,
                            size: 28,
                          )),
                    ],
                  )

                ),
              ),
            ]
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.indigo,
                Colors.blue,
                ]
              ),
              // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),
              //     bottomRight: Radius.circular(30)),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(1.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
          ),
          category("Flutter".tr(), image[0], desc[0]),
          category("C++".tr(), image[1], desc[1]),
          category("Java".tr(), image[2], desc[2]),
        ],
      ),
    );
  }

  Widget category(String langname, String im, String des) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          //   Navigator.of(context).pushReplacement(MaterialPageRoute(
          //     builder: (context) => getinfo(langname ),
          //   ));
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => getinfo(langname: langname),
          ));
        },
        child: Material(
          // color: Colors.amber,
          elevation: 10,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.blue,
                ]
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 200,
                      width: 200,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(im),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    des.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
