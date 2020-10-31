import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_vicoin/route/router_utils.dart';
import 'package:flutter_vicoin/util/flutter_toast.dart';

import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.action: _onAction,
    RegisterAction.registerAccount: _onRegisterAccount,
    Lifecycle.initState: _init,
  });
}

void _onAction(Action action, Context<RegisterState> ctx) {}

void _onRegisterAccount(Action action, Context<RegisterState> ctx) {
  var phone = ctx.state.phoneController.text;
  var code = ctx.state.codeController.text;
  var password = ctx.state.passwordController.text;
  var confirm = ctx.state.confirmController.text;
  var invite = ctx.state.inviteController.text;
  if (phone.isEmpty ||
      code.isEmpty ||
      password.isEmpty ||
      confirm.isEmpty ||
      invite.isEmpty) {
    FlutterToast.show("请检查并填写必填信息！");
    return;
  }

  FlutterToast.show("注册成功,快去登录吧");
  FluroNavigator.goBack(ctx.context);
}

void _init(Action action, Context<RegisterState> ctx) {
  ctx.dispatch(RegisterActionCreator.onInitData());
}
