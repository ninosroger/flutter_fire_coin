import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<QuotesState> buildEffect() {
  return combineEffects(<Object, Effect<QuotesState>>{
    QuotesAction.action: _onAction,
  });
}

void _onAction(Action action, Context<QuotesState> ctx) {
}
