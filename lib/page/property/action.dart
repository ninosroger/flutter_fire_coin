import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PropertyAction {
  action,
}

class PropertyActionCreator {
  static Action onAction() {
    return const Action(PropertyAction.action);
  }
}
