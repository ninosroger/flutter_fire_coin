import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction {
  action,
  changePwdShowState,
  clearAccount,
  login,
}

class LoginActionCreator {
  static Action onAction() {
    return const Action(LoginAction.action);
  }

  static Action onChangePwdShowState() {
    return const Action(LoginAction.changePwdShowState);
  }

  static Action onClearAccount() {
    return const Action(LoginAction.clearAccount);
  }

  static Action onLogin() {
    return const Action(LoginAction.login);
  }
}
