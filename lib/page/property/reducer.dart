import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PropertyState> buildReducer() {
  return asReducer(
    <Object, Reducer<PropertyState>>{
      PropertyAction.action: _onAction,
    },
  );
}

PropertyState _onAction(PropertyState state, Action action) {
  final PropertyState newState = state.clone();
  return newState;
}
