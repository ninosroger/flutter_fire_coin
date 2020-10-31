import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_vicoin/util/flutter_toast.dart';
import 'package:flutter_vicoin/util/user_utils.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.updatePercentChange24hList: _onUpdatePercentChange24hList,
      HomeAction.updateVolume24hCnyList: _onUpdateVolume24hCnyList,
      HomeAction.updateTop10List: _onUpdateTop10List,
      HomeAction.checkLogin: _onCheckLogin,
      HomeAction.signOut: _onSignOut,
    },
  );
}

HomeState _onUpdatePercentChange24hList(HomeState state, Action action) {
  return state.clone()..percentChange24hList = action.payload;
}

HomeState _onUpdateVolume24hCnyList(HomeState state, Action action) {
  return state.clone()..volume24hCnyList = action.payload;
}

HomeState _onUpdateTop10List(HomeState state, Action action) {
  return state.clone()..top10List = action.payload;
}

HomeState _onCheckLogin(HomeState state, Action action) {
  return state.clone()
    ..hasLogin = action.payload
    ..account = (action.payload ? "Hi," : "") + getAccount()
    ..invite = (action.payload ? "邀请码:" : "") + getInvite();
}

HomeState _onSignOut(HomeState state, Action action) {
  signOut();
  FlutterToast.show("退出登录");
  return state.clone()
    ..hasLogin = false
    ..account = "点击登录"
    ..invite = "欢迎来到Huobi";
}
