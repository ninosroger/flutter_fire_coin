import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vicoin/entity/quotes_entity.dart';

class HomeState implements Cloneable<HomeState> {
  List<String> tabs = ["综合榜", "涨幅榜", "成交额榜"];
  TabController tabController;
  Timer quotesTimer;
  var account = "点击登录";
  var invite = "欢迎来到Huobi";
  var hasLogin = false;

  List<String> bannerArticle = new List();
  List<QuotesEntity> percentChange24hList;
  List<QuotesEntity> volume24hCnyList;
  List<QuotesEntity> top10List;

  @override
  HomeState clone() {
    return HomeState()
      ..tabs = tabs
      ..tabController = tabController
      ..percentChange24hList = percentChange24hList
      ..volume24hCnyList = volume24hCnyList
      ..account = account
      ..invite = invite
      ..bannerArticle = bannerArticle
      ..hasLogin = hasLogin
      ..top10List = top10List;
  }
}

HomeState initState(Map<String, dynamic> args) {
  var state = HomeState();
  state.tabController =
      TabController(length: state.tabs.length, vsync: ScrollableState());
  return state;
}
