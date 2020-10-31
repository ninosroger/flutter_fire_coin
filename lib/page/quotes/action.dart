import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum QuotesAction { action }

class QuotesActionCreator {
  static Action onAction() {
    return const Action(QuotesAction.action);
  }
}
