import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class IndexState implements Cloneable<IndexState> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  Timer quotesTimer;

  @override
  IndexState clone() {
    return IndexState()
      ..selectedIndex = selectedIndex
      ..pageController = pageController;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState();
}
