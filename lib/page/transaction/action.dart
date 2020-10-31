import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TransactionAction {
  action,
  userSelectCount,
  changeSelectCountToZero,
  priceAdd,
  priceSub
}

class TransactionActionCreator {
  static Action onAction() {
    return const Action(TransactionAction.action);
  }

  static Action onUserSelectCount(int value) {
    return Action(TransactionAction.userSelectCount, payload: value);
  }

  static Action onPriceAdd() {
    return Action(TransactionAction.priceAdd);
  }

  static Action onPriceSub() {
    return Action(TransactionAction.priceSub);
  }

  static Action onChangeSelectCountToZero() {
    return Action(TransactionAction.changeSelectCountToZero);
  }
}
