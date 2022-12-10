import 'package:biryabanci/view/screens/CreateAccount.dart';
import 'package:biryabanci/view/screens/Home.dart';
import 'package:biryabanci/view/screens/WelcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:biryabanci/view/screens/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

late SharedPreferences prefs;
void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void getLoginStatus() async {
    prefs = await SharedPreferences.getInstance();
    /*   globals.gAuth.googleSignIn.isSignedIn().then((value) {
      prefs.setBool("isLoggedin", value);
    });*/
  }

  @override
  void initState() {
    getLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: Provider.of<ThemeModel>(context).currentTheme,
      debugShowCheckedModeBanner: false,
      //     home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => SplashScreen(),
        '/createaccount': (context) =>   CreateAccountPage(),
        '/login': (context) => SplashScreen(),
        '/homepage': (context) => SplashScreen(),
        '/settings': (context) => SplashScreen(),

      },
    );
  }
}