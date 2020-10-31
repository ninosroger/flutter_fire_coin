import 'package:fish_redux/fish_redux.dart';

enum IndexAction { onChangeTabItem,goLogin }

class IndexActionCreator {
  static Action onChangeTabItem(int index) {
    return Action(IndexAction.onChangeTabItem, payload: index);
  }

  static Action goLogin(int index) {
    return Action(IndexAction.goLogin, payload: index);
  }
}
