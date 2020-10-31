import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_vicoin/route/router_utils.dart';
import 'package:flutter_vicoin/route/routers.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<SplashState> ctx) {
  goIndex(ctx);
}

void goIndex(ctx) {
  Future.delayed(Duration(seconds: 2), () {
    FluroNavigator.push(ctx.context, Routers.index, clearStack: true);
  });
}
