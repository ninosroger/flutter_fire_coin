import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class IndexPage extends Page<IndexState, Map<String, dynamic>> {
  IndexPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<IndexState>(
                adapter: null,
                slots: <String, Dependent<IndexState>>{
                }),
            middleware: <Middleware<IndexState>>[
            ],);

}
