import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class LoginState implements Cloneable<LoginState> {
  final nodeAccount = FocusNode();
  final nodePassword = FocusNode();
  var accountController = TextEditingController();
  var passwordController = TextEditingController();
  String account = "";
  String password = "";
  bool isShowPwd = false;

  @override
  LoginState clone() {
    return LoginState()
      ..account = account
      ..password = password
      ..accountController = accountController
      ..passwordController = passwordController
      ..isShowPwd = isShowPwd;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
