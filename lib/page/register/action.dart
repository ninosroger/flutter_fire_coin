import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction {
  action,
  clearInvite,
  clearPhone,
  clearCode,
  changePwdShowState,
  changeConfirmShowState,
  initData,
  registerAccount,
}

class RegisterActionCreator {
  static Action onAction() {
    return const Action(RegisterAction.action);
  }

  static Action onClearInvite() {
    return const Action(RegisterAction.clearInvite);
  }

  static Action onClearPhone() {
    return const Action(RegisterAction.clearPhone);
  }

  static Action onClearCode() {
    return const Action(RegisterAction.clearCode);
  }

  static Action onChangePwdShowState() {
    return const Action(RegisterAction.changePwdShowState);
  }

  static Action onChangeConfirmShowState() {
    return const Action(RegisterAction.changeConfirmShowState);
  }

  static Action onInitData() {
    return const Action(RegisterAction.initData);
  }

  static Action onRegisterAccount() {
    return const Action(RegisterAction.registerAccount);
  }
}
