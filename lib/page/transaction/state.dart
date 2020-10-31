import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class TransactionState implements Cloneable<TransactionState> {
  List<String> tabs = ["我的买入", "我的卖出"];
  TabController tabController;
  var countController = TextEditingController();
  var priceController = TextEditingController();
  int selectCount = 0;
  final nodePrice = FocusNode();
  final nodeCount = FocusNode();

  @override
  TransactionState clone() {
    return TransactionState()
      ..tabs = tabs
      ..tabController = tabController
      ..countController = countController
      ..priceController = priceController
      ..selectCount = selectCount;
  }
}

TransactionState initState(Map<String, dynamic> args) {
  var state = TransactionState();
  state.tabController =
      TabController(length: state.tabs.length, vsync: ScrollableState());
  return state;
}
