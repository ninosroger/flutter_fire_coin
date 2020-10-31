import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<QuotesState> buildReducer() {
  return asReducer(
    <Object, Reducer<QuotesState>>{
      QuotesAction.action: _onAction,
    },
  );
}

QuotesState _onAction(QuotesState state, Action action) {
  final QuotesState newState = state.clone();
  return newState;
}
