import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RegisterState> buildReducer() {
  return asReducer(
    <Object, Reducer<RegisterState>>{
      RegisterAction.clearInvite: _onClearInvite,
      RegisterAction.clearPhone: _onClearPhone,
      RegisterAction.clearCode: _onClearCode,
      RegisterAction.changePwdShowState: _onChangePwdShowState,
      RegisterAction.changeConfirmShowState: _onChangeConfirmShowState,
      RegisterAction.initData: _initData,
    },
  );
}

RegisterState _onClearInvite(RegisterState state, Action action) {
  return state.clone()
    ..inviteController.text = "";
}

RegisterState _onClearPhone(RegisterState state, Action action) {
  return state.clone()
    ..phoneController.text = "";
}

RegisterState _onClearCode(RegisterState state, Action action) {
  return state.clone()
    ..codeController.text = "";
}

RegisterState _onChangePwdShowState(RegisterState state, Action action) {
  return state.clone()..isShowPwd = !state.isShowPwd;
}

RegisterState _onChangeConfirmShowState(RegisterState state, Action action) {
  return state.clone()..isShowConfirm = !state.isShowConfirm;
}

RegisterState _initData(RegisterState state, Action action) {
  return state.clone()..inviteController.text = "Q0DEDS2J";
}
