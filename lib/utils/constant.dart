import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/color.dart';

class CustomStyle {
  static const TextStyle primaryTextStyle = TextStyle(
      fontFamily: 'Red Hat Display',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static const TextStyle secondTextStyle = TextStyle(
      fontFamily: 'Red Hat Display',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: colors.secondtextcolor);

  static const TextStyle thirdTextStyle = TextStyle(
      fontFamily: 'Red Hat Display',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black);

  static BoxDecoration primaryBoxDecoration = BoxDecoration(
//      border: Border.all(color: colors.secondcolor),
      borderRadius: BorderRadius.circular(0)
  );

  static BoxDecoration secondBoxDecoration = BoxDecoration(
      color: colors.secondcolor,
      border: Border.all(color: colors.secondcolor),
      borderRadius: BorderRadius.circular(15)
  );

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: colors.buttoncolor,
    padding: const EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // <-- Radius
    ),
  );
}

Row buttonText(String text) {
  return Row(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: <Widget>[
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    ],
  );
}

InputDecoration inputDecoration(TextStyle textStyle, String text) {
  return InputDecoration(
      labelText: text,
      labelStyle: textStyle,
      errorStyle: TextStyle(color: colors.warningcolor, fontSize: 16.0),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: colors.bordercolor,
            width: 2
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: colors.bordercolor,
            width: 2
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: colors.bordercolor,
            width: 2
          )
      )
  );
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: colors.secondcolor,
      fontSize: 14.0
  );
}