import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBar {
  static void show(BuildContext context, String msg, {int duration = 2}) {
    Flushbar(
      message: msg,
      duration: Duration(seconds: duration),
    )..show(context);
  }
}
