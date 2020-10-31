import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
      IndexAction.onChangeTabItem: _onChangeTabItem,
    },
  );
}

IndexState _onChangeTabItem(IndexState state, Action action) {
  state.selectedIndex = action.payload;
  state.pageController.jumpToPage(state.selectedIndex);
  return state.clone();
}
