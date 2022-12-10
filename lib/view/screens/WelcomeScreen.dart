import 'dart:async';
import 'dart:convert';
import 'package:biryabanci/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:biryabanci/utils/color.dart';


class WelcomePage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<WelcomePage> {
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
//      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => Onboarding()));
    }
  }

  void initState() {
    super.initState();
    //   check_if_already_login();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
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
        child: LayoutBuilder(
          builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.50,
                                child: Image.asset(
                                  'assets/images/welcome.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(0, 3), // Shadow position
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              "Lorem ipsum dolor sit",
                              textAlign: TextAlign.center,
                              style: CustomStyle.primaryTextStyle
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit",
                              textAlign: TextAlign.center,
                              style: CustomStyle.secondTextStyle,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/createaccount');
                                },
                                style: CustomStyle.primaryButtonStyle,
                                child: buttonText('HADİ BAŞLAYALIM'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showDialog1(String errdesc) {
    showDialog(
      context: context,
      barrierDismissible: false, //sadece butonlara basınca ekrandan çıkıyor
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Dikkat!'),
          content: Text(errdesc),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: MaterialButton(
                shape: const StadiumBorder(),
                minWidth: 80,
                color: Colors.red,
                child: const Text(
                  "Kapat",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}