import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomSnackBar(String? message, {bool isError = true}) {
  if (message != null && message.isNotEmpty) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: isError ? Colors.red : Colors.green,
     /* msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP, // Toast appears at the top
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.transparent,
      //isError ? Colors.red : Colors.green,
      textColor: isError ? Colors.red : Colors.green,
      fontSize: 14.sp,*/
    );
  }
}

void toastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.transparent,
    textColor: Colors.transparent,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
  );
}
