import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class QuotesState implements Cloneable<QuotesState> {
  List<String> coinTabs = ["USDT", "BTC", "ETH", "ALTS"];
  TabController coinTabController;
  List<String> typeTabs = ["自选", "全部", "主板", "创业板", "合约"];
  TabController typeTabController;

  @override
  QuotesState clone() {
    return QuotesState()
      ..coinTabs = coinTabs
      ..coinTabController = coinTabController
      ..typeTabs = typeTabs
      ..typeTabController = typeTabController;
  }
}

QuotesState initState(Map<String, dynamic> args) {
  var state = QuotesState();
  state.coinTabController =
      TabController(length: state.coinTabs.length, vsync: ScrollableState());
  state.typeTabController =
      TabController(length: state.typeTabs.length, vsync: ScrollableState());
  return state;
}
