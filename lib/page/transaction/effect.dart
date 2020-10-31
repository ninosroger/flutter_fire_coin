import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TransactionState> buildEffect() {
  return combineEffects(<Object, Effect<TransactionState>>{
    TransactionAction.action: _onAction,
  });
}

void _onAction(Action action, Context<TransactionState> ctx) {
}
