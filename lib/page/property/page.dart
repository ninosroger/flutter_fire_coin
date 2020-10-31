import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PropertyPage extends Page<PropertyState, Map<String, dynamic>> {
  PropertyPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PropertyState>(
                adapter: null,
                slots: <String, Dependent<PropertyState>>{
                }),
            middleware: <Middleware<PropertyState>>[
            ],);

}
