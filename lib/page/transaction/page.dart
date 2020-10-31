import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TransactionPage extends Page<TransactionState, Map<String, dynamic>> {
  TransactionPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TransactionState>(
                adapter: null,
                slots: <String, Dependent<TransactionState>>{
                }),
            middleware: <Middleware<TransactionState>>[
            ],);

}
