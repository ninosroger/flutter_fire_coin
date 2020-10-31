import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vicoin/resources/strings.dart';
import 'package:flutter_vicoin/util/flutter_toast.dart';

class DoubleTapExitApp extends StatefulWidget {
  const DoubleTapExitApp({
    Key key,
    @required this.child,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  _DoubleTapExitAppState createState() => _DoubleTapExitAppState();
}

class _DoubleTapExitAppState extends State<DoubleTapExitApp> {
  DateTime _lastTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExit,
      child: widget.child,
    );
  }

  Future<bool> _isExit() async {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime) > widget.duration) {
      _lastTime = DateTime.now();
      FlutterToast.show(AppStrings.double_tap_back_tips);
      return Future.value(false);
    }

    await SystemNavigator.pop();
    return Future.value(true);
  }
}
