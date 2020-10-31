import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast {
  static void show(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: Dimens.font_sp14,
      backgroundColor: AppColors.app_main_blue,
      textColor: AppColors.app_white,
    );
  }
}
