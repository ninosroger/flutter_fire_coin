import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/widget/icon_appbar.dart';
import 'package:flutter_vicoin/widget/toggle_tab.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    QuotesState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: Scaffold(
      backgroundColor: AppColors.app_white,
      appBar: IconAppBar(
        title: "行情",
        endIcon: Icon(
          Feather.search,
          size: Dimens.dp20,
          color: AppColors.text_black,
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: AppColors.app_white,
            child: ToggleTab(
              height: 32,
              borderRadius: 6,
              initialIndex: 0,
              selectedBackgroundColors: [AppColors.app_main_blue],
              unSelectedBackgroundColors: [AppColors.app_white],
              selectedTextStyle:
                  TextStyle(color: AppColors.app_white, fontSize: 14),
              unSelectedTextStyle:
                  TextStyle(color: AppColors.app_light_gray, fontSize: 14),
              labels: state.typeTabs,
              selectedLabelIndex: (index) {},
            ),
          ),
          StickyHeader(
            header: Container(
                color: AppColors.app_white,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    TabBar(
                      tabs: state.coinTabs.map((e) => Text(e)).toList(),
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: state.coinTabController,
                      indicatorColor: AppColors.app_main_blue,
                      unselectedLabelColor: AppColors.app_light_gray,
                      labelColor: AppColors.app_main_blue,
                      labelPadding: EdgeInsets.all(8),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.font_sp14),
                    ),
                    const Divider(
                      height: 1,
                      indent: 10,
                      endIndent: 10,
                      color: AppColors.line_gray,
                    ),
                    Container(
                      height: 30,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "名称",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: Dimens.font_sp12,
                                  color: AppColors.app_light_gray),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text(
                              "最新价",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: Dimens.font_sp12,
                                  color: AppColors.app_light_gray),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Text(
                              "涨跌幅",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: Dimens.font_sp12,
                                  color: AppColors.app_light_gray),
                              textAlign: TextAlign.end,
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            content: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                      height: 60,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "CNN",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: Dimens.font_sp16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.text_black),
                                          ),
                                          Text(
                                            "/BTC",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: Dimens.font_sp11,
                                                color:
                                                    AppColors.app_light_gray),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "24H量 3637153187",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: Dimens.font_sp12,
                                              color: AppColors.app_light_gray),
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
                                          "63.19332627",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: Dimens.font_sp16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.text_black),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "￥1.53187",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: Dimens.font_sp12,
                                              color: AppColors.app_light_gray),
                                        ),
                                      ),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: 34,
                                      width: 78,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        onPressed: () {},
                                        padding: EdgeInsets.all(0),
                                        color: AppColors.text_green,
                                        child: Text('+37.43%',
                                            style: TextStyle(
                                                fontSize: Dimens.font_sp15,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.app_white)),
                                      ),
                                    ),
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
                  itemCount: 30,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                )),
          ),
        ],
      ),
    ),
  );
}
