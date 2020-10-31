import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_vicoin/util/flutter_toast.dart';

import 'action.dart';
import 'state.dart';

Reducer<TransactionState> buildReducer() {
  return asReducer(
    <Object, Reducer<TransactionState>>{
      TransactionAction.userSelectCount: _onUserSelectCount,
      TransactionAction.changeSelectCountToZero: _onChangeSelectCountToZero,
      TransactionAction.priceAdd: _onPriceAdd,
      TransactionAction.priceSub: _onPriceSub,
    },
  );
}

TransactionState _onUserSelectCount(TransactionState state, Action action) {
  return state.clone()
    ..selectCount = action.payload
    ..countController.text = action.payload.toString();
}

TransactionState _onChangeSelectCountToZero(
        TransactionState state, Action action) =>
    state.clone()..selectCount = 0;

TransactionState _onPriceAdd(TransactionState state, Action action) {
  var price = double.parse(state.priceController.text);
  int num = (price * 100).toInt();
  num += 100;
  String s = num.toString().substring(0, num.toString().length - 2);
  String e = num.toString().substring(num.toString().length - 2);
  price = double.parse("$s.$e");
  return state.clone()
    ..priceController.text = price.toString();
}

TransactionState _onPriceSub(TransactionState state, Action action) {
  var price = double.parse(state.priceController.text);
  int num = (price * 100).toInt();
  if (num < 100) {
    FlutterToast.show("价格已减至最低");
    return state;
  } else if (num == 100) {
    price = 0.0;
    return state.clone()
      ..priceController.text = price.toString();
  } else {
    num -= 100;
    String s = num.toString().substring(0, num.toString().length - 2);
    String e = num.toString().substring(num.toString().length - 2);
    price = double.parse("$s.$e");
    return state.clone()
      ..priceController.text = price.toString();
  }
}
