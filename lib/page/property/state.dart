import 'package:fish_redux/fish_redux.dart';

class PropertyState implements Cloneable<PropertyState> {
  String coin = "0.000000";
  String cny = "0.00";

  @override
  PropertyState clone() {
    return PropertyState()
      ..cny = cny
      ..coin = coin;
  }
}

PropertyState initState(Map<String, dynamic> args) {
  var state = PropertyState();
  return state;
}
