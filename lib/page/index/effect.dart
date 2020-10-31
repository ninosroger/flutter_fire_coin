import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_vicoin/entity/quotes_entity.dart';
import 'package:flutter_vicoin/global_field.dart';
import 'package:flutter_vicoin/net/api.dart';
import 'package:flutter_vicoin/net/quotes_manager.dart';
import 'package:flutter_vicoin/page/index/action.dart';
import 'package:flutter_vicoin/route/router_utils.dart';
import 'package:flutter_vicoin/route/routers.dart';
import 'package:flutter_vicoin/util/user_utils.dart';
import 'state.dart';

Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    IndexAction.goLogin: _goLogin,
  });
}

void _initState(Action action, Context<IndexState> ctx) {
  getFirstQuotesData();
  ctx.state.quotesTimer =
      Timer.periodic(const Duration(seconds: 30), (timer) => getQuotesData());
}

void _dispose(Action action, Context<IndexState> ctx) {
  ctx.state.quotesTimer.cancel();
}

void _goLogin(Action action, Context<IndexState> ctx) {
  int index = action.payload;
  if (index == 3) {
    if (hasLogin()) {
      ctx.dispatch(IndexActionCreator.onChangeTabItem(index));
    } else {
      FluroNavigator.push(ctx.context, Routers.login);
    }
  } else {
    ctx.dispatch(IndexActionCreator.onChangeTabItem(index));
  }
}

void getQuotesData() {
  QuotesNet.instance.requestNetwork<List<QuotesEntity>>(
    Method.GET,
    Api.huobiQuotes,
    onSuccess: (data) {
      saveData(data);
    },
    onError: (code, msg) {
      getQuotesData();
    },
  );
}

void getFirstQuotesData() {
  QuotesNet.instance.requestNetwork<List<QuotesEntity>>(
    Method.GET,
    Api.huobiQuotes,
    onSuccess: (data) {
      saveData(data);
      GlobalField.bus.emit("home_quotes");
    },
    onError: (code, msg) {
      getFirstQuotesData();
    },
  );
}

Future<void> saveData(List<QuotesEntity> data) async {
  var db = await GlobalField.database;
  db.delete(GlobalField.quotesTable);
  var batch = db.batch();
  data.forEach(
      (element) => batch.insert(GlobalField.quotesTable, element.toJson()));
  List<dynamic> results = await batch.commit(
    continueOnError: true,
  );
}
