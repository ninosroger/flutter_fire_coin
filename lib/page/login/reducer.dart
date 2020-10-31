import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.changePwdShowState: _onChangePwdShowState,
      LoginAction.clearAccount: _onClearAccount,
    },
  );
}

LoginState _onChangePwdShowState(LoginState state, Action action) {
  return state.clone()..isShowPwd = !state.isShowPwd;
}

LoginState _onClearAccount(LoginState state, Action action) {
  return state.clone()
    ..account = ""
    ..accountController.text = "";
}
