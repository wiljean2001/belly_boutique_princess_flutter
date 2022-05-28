import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {

  static Future<void> showMessage({
    required String msg,
    Color backGroundColor = Colors.white,
    Color textColor = Colors.black,
  }) async {
    await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backGroundColor,
        textColor: textColor,
        fontSize: 16.0);
  }
}
