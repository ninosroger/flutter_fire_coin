import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/page/home/page.dart';
import 'package:flutter_vicoin/page/property/page.dart';
import 'package:flutter_vicoin/page/quotes/page.dart';
import 'package:flutter_vicoin/page/transaction/page.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/strings.dart';
import 'package:flutter_vicoin/widget/double_tap_exit_app.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {
  return DoubleTapExitApp(
    child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.app_white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.trello),
              label: AppStrings.index_home,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.suitcase),
              label: AppStrings.index_quotes,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.users),
              label: AppStrings.index_transaction,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.google_wallet),
              label: AppStrings.index_property,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: state.selectedIndex,
          elevation: 5.0,
          iconSize: 21.0,
          selectedFontSize: Dimens.font_sp10,
          unselectedFontSize: Dimens.font_sp10,
          selectedItemColor: AppColors.app_main_blue,
          unselectedItemColor: AppColors.app_gray,
          onTap: (index) => dispatch(IndexActionCreator.goLogin(index)),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(), // 禁止滑动
          controller: state.pageController,
          children: [
            HomePage().buildPage(null),
            QuotesPage().buildPage(null),
            TransactionPage().buildPage(null),
            PropertyPage().buildPage(null),
          ],
        )),
  );
}
