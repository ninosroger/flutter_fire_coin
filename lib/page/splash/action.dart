import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SplashAction { startCountDown }

class SplashActionCreator {
  static Action onStartCountDown() {
    return const Action(SplashAction.startCountDown);
  }
}
