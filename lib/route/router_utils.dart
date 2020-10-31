import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../global_field.dart';

class FluroNavigator {
  static void push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    unfocus();
    GlobalField.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native);
  }

  static void pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    unfocus();
    GlobalField.router
        .navigateTo(context, path,
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((Object result) {
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((dynamic error) {
      print('$error');
    });
  }

  static void goBack(BuildContext context) {
    unfocus();
    Navigator.pop(context);
  }

  static void goBackWithParams(BuildContext context, Object result) {
    unfocus();
    Navigator.pop<Object>(context, result);
  }

  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
