import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PropertyState> buildEffect() {
  return combineEffects(<Object, Effect<PropertyState>>{
    Lifecycle.initState: _init,
    PropertyAction.action: _onAction,
  });
}

void _init(Action action, Context<PropertyState> ctx) {}

void _onAction(Action action, Context<PropertyState> ctx) {}
