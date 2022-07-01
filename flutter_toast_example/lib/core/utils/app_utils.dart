import 'package:flutter/material.dart';
import 'package:flutter_toast_example/core/shared/ui_color.dart';
import 'package:flutter_toast_example/core/shared/ui_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  //show toast message
  static showToastSort(BuildContext context, {required String msg}) {
    return Fluttertoast.showToast(
        msg: UIText.sortToast,
        backgroundColor: UIColor.silvertree,
        textColor: UIColor.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT);
  }

  static showToastLong(BuildContext context, {required String msg}) {
    return Fluttertoast.showToast(
        msg: UIText.longToast,
        backgroundColor: UIColor.silvertree,
        textColor: UIColor.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }

  static showToastBottom(BuildContext context, {required String msg}) {
    return Fluttertoast.showToast(
      msg: UIText.bottomToast,
      backgroundColor: UIColor.silvertree,
      textColor: UIColor.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static showToastCenter(BuildContext context, {required String msg}) {
    return Fluttertoast.showToast(
      msg: UIText.centerToast,
      backgroundColor: UIColor.silvertree,
      textColor: UIColor.white,
      gravity: ToastGravity.CENTER,
    );
  }

  static showToastTop(BuildContext context, {required String msg}) {
    return Fluttertoast.showToast(
      msg: UIText.topToast,
      backgroundColor: UIColor.silvertree,
      textColor: UIColor.white,
      gravity: ToastGravity.TOP,
    );
  }
}
