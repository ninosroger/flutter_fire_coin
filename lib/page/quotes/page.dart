import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class QuotesPage extends Page<QuotesState, Map<String, dynamic>> {
  QuotesPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<QuotesState>(
                adapter: null,
                slots: <String, Dependent<QuotesState>>{
                }),
            middleware: <Middleware<QuotesState>>[
            ],);

}
