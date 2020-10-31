import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:lottie/lottie.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light,
    child: Container(
      color: AppColors.app_main_blue,
      child: SafeArea(
          child: Lottie.asset(
        'assets/lottie/o.json',
        repeat: false,
        onLoaded: (composition) =>
            dispatch(SplashActionCreator.onStartCountDown()),
      )),
    ),
  );
}
