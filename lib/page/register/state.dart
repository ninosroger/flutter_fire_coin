import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class RegisterState implements Cloneable<RegisterState> {
  final inviteNode = FocusNode();
  var inviteController = TextEditingController();
  final phoneNode = FocusNode();
  var phoneController = TextEditingController();
  final passwordNode = FocusNode();
  var passwordController = TextEditingController();
  final confirmNode = FocusNode();
  var confirmController = TextEditingController();
  final codeNode = FocusNode();
  var codeController = TextEditingController();

  bool isShowPwd = false;
  bool isShowConfirm = false;

  @override
  RegisterState clone() {
    return RegisterState()
      ..inviteController = inviteController
      ..phoneController = phoneController
      ..passwordController = passwordController
      ..confirmController = confirmController
      ..codeController = codeController
      ..isShowConfirm = isShowConfirm
      ..isShowPwd = isShowPwd;
  }
}

RegisterState initState(Map<String, dynamic> args) {
  return RegisterState();
}
