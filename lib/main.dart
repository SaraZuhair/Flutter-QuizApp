import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarazuhair_quizapp/page1.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sarazuhair_quizapp/provider/themeprovider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      saveLocale: true,
      path: 'assets/lang',
      supportedLocales: const [
        Locale("ar", "IQ"),
        Locale("en", "US"),
      ],
      child: ChangeNotifierProvider(
          create: (context) => ThemeChanger(), child: const MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(builder: (context, value, child) {
      return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // themeMode: EasyDynamicTheme.of(context).themeMode,
        // theme: MyThemes.lightTheme,
        // darkTheme: MyThemes.darkTheme,

        debugShowCheckedModeBanner: false,
        title: 'SmartQuiz',
        themeMode: value.getTheme,
        // ThemeMode.system,
        // theme: ThemeData(
        //   primarySwatch: Colors.cyan,
        // ),

        theme: ThemeData.light(),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color(0xFF253341)),
          scaffoldBackgroundColor: const Color(0xFF15202B),
        ),
        // themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,

        home: const firstscreen(),
      );
    });
  }
}
