import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/spaces.dart';
import 'package:flutter_vicoin/widget/property_appbar.dart';

import 'state.dart';

Widget buildView(
    PropertyState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.light,
    child: Scaffold(
      backgroundColor: AppColors.app_white,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            flexibleSpace: new FlexibleSpaceBar(
              background: Container(
                color: AppColors.own_blue,
                height: 200,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "总账户资产折合（BTC）",
                      style: TextStyle(
                          fontSize: Dimens.font_sp14,
                          color: AppColors.line_gray),
                    ),
                    Spaces.vSpace8,
                    Text(
                      state.coin,
                      style: TextStyle(
                          fontSize: Dimens.font_sp28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.app_white),
                    ),
                    Spaces.vSpace8,
                    Text(
                      "≈${state.cny} CNY",
                      style: TextStyle(
                          fontSize: Dimens.font_sp14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.line_gray),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
            ),
            title: Text(
              "资产",
              style: TextStyle(color: AppColors.app_white),
            ),
            backgroundColor: AppColors.own_blue,
            titleSpacing: NavigationToolbar.kMiddleSpacing,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            snap: false,
            bottom: PropertyBar(),
          ),
          new SliverFixedExtentList(
            itemExtent: 110.0,
            delegate: new SliverChildBuilderDelegate(
              (context, index) => Container(
                  height: 110,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "USDT",
                                style: TextStyle(
                                    fontSize: Dimens.font_sp16,
                                    color: AppColors.app_main_blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Icon(
                              AntDesign.right,
                              size: 14,
                              color: AppColors.app_light_gray,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "可用",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Dimens.font_sp12,
                                          color: AppColors.app_light_gray),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "63.19332627",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Dimens.font_sp14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.text_black),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "冻结",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Dimens.font_sp12,
                                          color: AppColors.app_light_gray),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "0.00000000",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Dimens.font_sp14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.text_black),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "折合[CNY]",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Dimens.font_sp12,
                                          color: AppColors.app_light_gray),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "0.00",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Dimens.font_sp14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.app_gray),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: AppColors.line_gray,
                      ),
                    ],
                  )),
              childCount: 10,
            ),
          ),
        ],
      ),
    ),
  );
}
