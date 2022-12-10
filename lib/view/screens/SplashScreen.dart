import 'package:biryabanci/view/screens/Home.dart';
import 'package:biryabanci/view/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences logindata;
  late bool newuser;

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? false);
    print(newuser);
    if (newuser) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
  }

  @override
  void initState() {
    super.initState();
    //   pageRotate();
    Timer(const Duration(seconds: 3), () => check_if_already_login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill
            )
          ),
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              //        color: Colors.white
                            ),
                            child: Image.asset(
                              'assets/images/splashlogo.png',
                              height: 190,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text(
                              'Bir Yabancı',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                /*    const SpinKitCircle(
                      color: Colors.orange,
                      size: 50.0,
                    ),*/
                  ],
                ),
              )
            ],
          ),
        ));
  }
}