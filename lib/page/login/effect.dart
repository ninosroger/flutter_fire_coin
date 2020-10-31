import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_vicoin/global_field.dart';
import 'package:flutter_vicoin/route/router_utils.dart';
import 'package:flutter_vicoin/util/flutter_toast.dart';

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.login: _onLogin,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onLogin(Action action, Context<LoginState> ctx) {
  var account = ctx.state.accountController.text;
  var password = ctx.state.passwordController.text;
  if (account.isEmpty) {
    FlutterToast.show("请输入手机号！");
    return;
  }
  if (password.isEmpty) {
    FlutterToast.show("请输入密码！");
    return;
  }

  FlutterToast.show("恭喜您登录成功");
  GlobalField.prefs.setString(GlobalField.userInfo, '{"cis":"0.0000","me":0,"team":0,"invite":"D45ESF6U","invite_link":""}');
  GlobalField.prefs.setString(
      GlobalField.account,
      account.length == 11
          ? "${account.substring(0, 3)}****${account.substring(7)}"
          : account);
  GlobalField.bus.emit("home", true);
  saveToken();
  FluroNavigator.goBackWithParams(ctx.context, true);
}

Future<void> saveToken() async {
  GlobalField.prefs.setString(GlobalField.token, "this is token value");
}
