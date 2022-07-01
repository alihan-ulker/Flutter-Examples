import 'package:flutter/material.dart';
import 'package:flutter_toast_example/core/shared/ui_color.dart';
import 'package:toast/toast.dart';

class AppUtils {
  //show toast message
  static showToast(BuildContext context, {required String msg}) {
    return Toast.show(
      msg,
      backgroundColor: UIColor.silvertree,
      textStyle: UIColor.white,
      gravity: Toast.bottom,
      duration: 4,
    );
  }
}
