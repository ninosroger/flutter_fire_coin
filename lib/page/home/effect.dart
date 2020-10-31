import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_vicoin/entity/quotes_entity.dart';
import 'package:flutter_vicoin/generated/json/base/json_convert_content.dart';
import 'package:flutter_vicoin/global_field.dart';
import 'package:flutter_vicoin/util/user_utils.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
  });
}

void _initState(Action action, Context<HomeState> ctx) {
  GlobalField.bus.on("home", (arg) {
    ctx.dispatch(HomeActionCreator.onCheckLogin(arg as bool));
  });
  GlobalField.bus.on("home_quotes", (arg) {
    updateQuotesData(ctx);
  });
  ctx.state.quotesTimer = Timer.periodic(
      const Duration(seconds: 10), (timer) => updateQuotesData(ctx));
  updateQuotesData(ctx);
  ctx.dispatch(HomeActionCreator.onCheckLogin(hasLogin()));
}

void _dispose(Action action, Context<HomeState> ctx) {
  GlobalField.bus.off("home");
  GlobalField.bus.off("home_quotes");
  ctx.state.quotesTimer.cancel();
}

Future<void> updateQuotesData(Context<HomeState> ctx) async {
  var db = await GlobalField.database;
  var percentChange24hMap = await db.query(GlobalField.quotesTable,
      limit: 10, orderBy: 'percent_change_24h desc');
  var volume24hCnyMap = await db.query(GlobalField.quotesTable,
      limit: 10, orderBy: 'volume_24h_cny desc');
  var top10Map =
      await db.query(GlobalField.quotesTable, limit: 10, orderBy: 'rank asc');
  var percentChange24hList =
      JsonConvert.fromJsonAsT<List<QuotesEntity>>(percentChange24hMap);
  var volume24hCnyList =
      JsonConvert.fromJsonAsT<List<QuotesEntity>>(volume24hCnyMap);
  var top10List = JsonConvert.fromJsonAsT<List<QuotesEntity>>(top10Map);
  if (percentChange24hList.isNotEmpty)
    ctx.dispatch(
        HomeActionCreator.onUpdatePercentChange24hList(percentChange24hList));
  if (volume24hCnyList.isNotEmpty)
    ctx.dispatch(HomeActionCreator.onUpdateVolume24hCnyList(volume24hCnyList));
  if (top10List.isNotEmpty)
    ctx.dispatch(HomeActionCreator.onUpdateTop10List(top10List));
}
