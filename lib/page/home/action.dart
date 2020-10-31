import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_vicoin/entity/quotes_entity.dart';

//TODO replace with your own action
enum HomeAction {
  updatePercentChange24hList,
  updateVolume24hCnyList,
  updateTop10List,
  checkLogin,
  getLoginState,
  signOut,
}

class HomeActionCreator {
  static Action onUpdatePercentChange24hList(
      List<QuotesEntity> percentChange24hList) {
    return Action(HomeAction.updatePercentChange24hList,
        payload: percentChange24hList);
  }

  static Action onUpdateVolume24hCnyList(List<QuotesEntity> volume24hCnyList) {
    return Action(HomeAction.updateVolume24hCnyList, payload: volume24hCnyList);
  }

  static Action onUpdateTop10List(List<QuotesEntity> top10List) {
    return Action(HomeAction.updateTop10List, payload: top10List);
  }

  static Action onCheckLogin(bool hasLogin) {
    return Action(HomeAction.checkLogin, payload: hasLogin);
  }

  static Action onGetLoginState() {
    return Action(HomeAction.getLoginState);
  }

  static Action onSignOut() {
    return Action(HomeAction.signOut);
  }
}
