import 'dart:async';
import 'dart:convert';
import 'package:biryabanci/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:biryabanci/utils/color.dart';


class CreateAccountPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<CreateAccountPage> {
  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  late SharedPreferences logindata;

  bool good = false;


  void initState() {
    super.initState();
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 140,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35),
                        width: MediaQuery.of(context).size.width,
                        decoration: CustomStyle.primaryBoxDecoration,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                                "Hesap Oluştur",
                                textAlign: TextAlign.center,
                                style: CustomStyle.primaryTextStyle
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Lütfen hesap bilgilerinizi girin",
                              textAlign: TextAlign.center,
                              style: CustomStyle.secondTextStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              child: TextFormField(
                      //        controller: _nameController,
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                validator: (String? value) {
                                  if (value != null) {
                                    return 'isim mevcut';
                                  } else if (value!.length > 79) {
                                    return 'Cihaz adı 80 karakterden fazla olamaz!';
                                  }
                                  return null;
                                },
                                style: CustomStyle.secondTextStyle,
                                decoration: inputDecoration(CustomStyle.secondTextStyle, "Telefon Numaranız"),
                              ),
                            ),
                            const Text(
                              "Bu telefon numarasını diğer kullanıcılar göremeyecektir",
                              textAlign: TextAlign.start,
                              style: CustomStyle.thirdTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          children: [
                            Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)
                                ),
                                activeColor: colors.secondcolor,
                                value: good,
                                onChanged: (val) {
                                  setState(() {
                                    good = val!;
                                  });
                                }),
                            const Text(
                              "Kullanım koşullarını ve Kişisel\nVerilerimin "
                                  "Aydınlatma metninde verilen\namaçlarda işlenmesini kabul ediyorum",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Red Hat Display',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: CustomStyle.primaryButtonStyle,
                            child: buttonText('ONAYLA')),
                      )
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