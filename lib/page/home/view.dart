import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_vicoin/page/home/action.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/spaces.dart';
import 'package:flutter_vicoin/route/router_utils.dart';
import 'package:flutter_vicoin/route/routers.dart';
import 'package:flutter_vicoin/util/prefs_utils.dart';
import 'package:flutter_vicoin/widget/rotate_text.dart';
import 'package:flutter_vicoin/widget/search_appbar.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  Widget tabTop10, tabVolume24hCny, tabPercentChange24h;
  tabTop10 = Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Column(
      children: [
        Container(
          height: 30,
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
                  "最新价[CNY]",
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
        Container(
            height: 540,
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                  height: 54,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    state.top10List[index].symbol,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: Dimens.font_sp16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.text_black),
                                  ),
                                ],
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Text(
                                state.top10List[index].priceCny.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: Dimens.font_sp16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.text_black),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    onPressed: () {},
                                    padding: EdgeInsets.all(0),
                                    color: state
                                            .top10List[index].percentChange1h
                                            .toString()
                                            .contains("-")
                                        ? AppColors.text_red
                                        : AppColors.text_green,
                                    child: Text(
                                        state.top10List[index].percentChange1h
                                                .toString()
                                                .contains("-")
                                            ? "${state.top10List[index].percentChange1h}%"
                                            : "+${state.top10List[index].percentChange1h}%",
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
              itemCount: state.top10List == null ? 0 : state.top10List.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            )),
      ],
    ),
  );
  tabVolume24hCny = Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Column(
      children: [
        Container(
          height: 30,
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
                  "最新价[CNY]",
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
                  "24H成交额[CNY]",
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
        Container(
            height: 540,
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                  height: 54,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    state.volume24hCnyList[index].symbol,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: Dimens.font_sp16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.text_black),
                                  ),
                                ],
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Text(
                                "${state.volume24hCnyList[index].priceCny}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: Dimens.font_sp16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.text_black),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    onPressed: () {},
                                    padding: EdgeInsets.all(0),
                                    color: AppColors.background_blue,
                                    child: Text(
                                        getPriceForCN(state
                                            .volume24hCnyList[index]
                                            .volume24hCny
                                            .toInt()),
                                        style: TextStyle(
                                            fontSize: Dimens.font_sp15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.app_main_blue)),
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
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            )),
      ],
    ),
  );
  tabPercentChange24h = Container(
    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Column(
      children: [
        Container(
          height: 30,
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
                  "最新价[CNY]",
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
        Container(
            height: 540,
            child: ListView.builder(
              itemBuilder: (context, index) => Container(
                  height: 54,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    state.percentChange24hList[index].symbol,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: Dimens.font_sp16,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.text_black),
                                  ),
                                ],
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Text(
                                state.percentChange24hList[index].priceCny
                                    .toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: Dimens.font_sp16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.text_black),
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
                                        borderRadius: BorderRadius.circular(6)),
                                    onPressed: () {},
                                    padding: EdgeInsets.all(0),
                                    color: state.percentChange24hList[index]
                                            .percentChange24h
                                            .toString()
                                            .contains("-")
                                        ? AppColors.text_red
                                        : AppColors.text_green,
                                    child: Text(
                                        state.percentChange24hList[index]
                                                .percentChange24h
                                                .toString()
                                                .contains("-")
                                            ? "${state.percentChange24hList[index].percentChange24h}%"
                                            : "+${state.percentChange24hList[index].percentChange24h}%",
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
              itemCount: state.percentChange24hList == null
                  ? 0
                  : state.percentChange24hList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            )),
      ],
    ),
  );
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: Scaffold(
      backgroundColor: AppColors.app_white,
      appBar: SearchBar(
        startIconTap: () {},
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.app_white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                decoration: BoxDecoration(
                  color: AppColors.app_white,
                ),
                child: InkWell(
                  onTap: () => FluroNavigator.pushResult(
                      viewService.context, Routers.login, (data) {
                    dispatch(HomeActionCreator.onCheckLogin(data));
                  }),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          state.account,
                          style: TextStyle(
                            color: AppColors.text_black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimens.font_sp24,
                          ),
                        ),
                        Spaces.vSpace12,
                        Row(
                          children: [
                            Text(
                              state.invite,
                              style: TextStyle(
                                color: AppColors.app_light_gray,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimens.font_sp14,
                              ),
                            ),
                            Spaces.vSpace8,
                            Visibility(
                                visible: state.hasLogin,
                                child: Icon(
                                  MaterialCommunityIcons.content_copy,
                                  size: 12,
                                  color: AppColors.app_light_gray,
                                )),
                          ],
                        ),
                        Spaces.vSpace12,
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.text_light_orange,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.dp8),
                              topRight: Radius.circular(Dimens.dp8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Zocial.github,
                                size: 24,
                                color: AppColors.text_orange,
                              ),
                              Spaces.hSpace4,
                              Expanded(
                                child: Text(
                                  "了解VIP等级及权益",
                                  style: TextStyle(
                                      color: AppColors.text_orange,
                                      fontSize: Dimens.font_sp14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                AntDesign.right,
                                size: 14,
                                color: AppColors.text_orange,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesome.file_text_o,
                  size: 22,
                ),
                title: Text(
                  '订单管理',
                  style: TextStyle(fontSize: Dimens.font_sp14),
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesome.unlink,
                  size: 24,
                ),
                title: Text(
                  '安全设置',
                  style: TextStyle(fontSize: Dimens.font_sp14),
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesome.comment_o,
                  size: 24,
                ),
                title: Text(
                  '关于我们',
                  style: TextStyle(fontSize: Dimens.font_sp14),
                ),
              ),
              ListTile(
                leading: Icon(
                  FontAwesome.send_o,
                  size: 23,
                ),
                title: Text(
                  '帮助中心',
                  style: TextStyle(fontSize: Dimens.font_sp14),
                ),
              ),
              Visibility(
                visible: state.hasLogin,
                child: ListTile(
                  onTap: () {
                    dispatch(HomeActionCreator.onSignOut());
                  },
                  leading: Icon(
                    FontAwesome.frown_o,
                    size: 26,
                  ),
                  title: Text(
                    '退出登录',
                    style: TextStyle(fontSize: Dimens.font_sp14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 152,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.dp10),
                    child: Image.asset(
                      "assets/images/huobi_banner.png",
                      fit: BoxFit.fill,
                    ));
              },
              autoplay: true,
              itemCount: 3,
              viewportFraction: 0.95,
              scale: 0.8,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Icon(
                    AntDesign.earth,
                    color: AppColors.text_black,
                    size: 15.0,
                  ),
                ),
              ),
              Expanded(
                child: RotateAnimatedTextKit(
                  text: getBannerText(),
                  textStyle:
                      TextStyle(fontSize: 12.0, color: AppColors.text_black),
                  textAlign: TextAlign.start,
                  repeatForever: true,
                  displayFullTextOnTap: true,
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Icon(
                    Entypo.menu,
                    color: AppColors.text_black,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            indent: 10,
            endIndent: 10,
            color: AppColors.line_gray,
          ),
          Spaces.vSpace6,
          SizedBox(
            height: 90.0,
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          state.top10List[index].symbol,
                          style: TextStyle(
                            color: AppColors.text_black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimens.font_sp12,
                          ),
                        ),
                        Spaces.hSpace2,
                        Text(
                          state.top10List[index].percentChange1h
                                  .toString()
                                  .contains("-")
                              ? "${state.top10List[index].percentChange1h}%"
                              : "+${state.top10List[index].percentChange1h}%",
                          style: TextStyle(
                            color: state.top10List[index].percentChange1h
                                    .toString()
                                    .contains("-")
                                ? AppColors.text_red
                                : AppColors.text_green,
                            fontSize: Dimens.font_sp11,
                          ),
                        ),
                      ],
                    ),
                    Spaces.vSpace6,
                    Text(
                      state.top10List[index].priceUsd.toString(),
                      style: TextStyle(
                        color: state.top10List[index].percentChange1h
                                .toString()
                                .contains("-")
                            ? AppColors.text_red
                            : AppColors.text_green,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.font_sp22,
                      ),
                    ),
                    Spaces.vSpace4,
                    Text(
                      "￥${state.top10List[index].priceCny.toString()}",
                      style: TextStyle(
                        color: AppColors.app_light_gray,
                        fontSize: Dimens.font_sp11,
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: state.top10List == null ? 0 : state.top10List.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
            ),
          ),
          const Divider(
            height: Dimens.dp10,
            thickness: Dimens.dp10,
            color: AppColors.app_background_gray,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.QQ,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "邀请奖励",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.skype,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "FIL狂欢月",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.taobao_square,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "活动挖矿",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.alipay_circle,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "锁仓挖矿",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.youtube,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "联系客服",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spaces.vSpace20,
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.wechat,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "全球观察区",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.twitter,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "DeFi板块",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.weibo,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "波卡生态板块",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.facebook_square,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "全仓杠杆",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            AntDesign.codepen_circle,
                            size: Dimens.dp28,
                            color: AppColors.app_gray,
                          ),
                          Spaces.vSpace8,
                          Text(
                            "官方社群",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.text_black,
                                fontSize: Dimens.font_sp11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: Dimens.dp10,
            thickness: Dimens.dp10,
            color: AppColors.app_background_gray,
          ),
          TabBar(
            tabs: state.tabs.map((e) => Text(e)).toList(),
            controller: state.tabController,
            indicatorColor: AppColors.app_main_blue,
            unselectedLabelColor: AppColors.app_light_gray,
            labelColor: AppColors.app_main_blue,
            labelPadding: EdgeInsets.all(8),
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, fontSize: Dimens.font_sp16),
          ),
          Container(
            height: 570,
            child: TabBarView(
              children: state.tabs.map((e) {
                switch (e) {
                  case "综合榜":
                    return tabTop10;
                    break;
                  case "涨幅榜":
                    return tabPercentChange24h;
                    break;
                  case "成交额榜":
                    return tabVolume24hCny;
                    break;
                }
              }).toList(),
              controller: state.tabController,
            ),
          ),
        ],
      ),
    ),
  );
}

String getPriceForCN(int price) {
  if (price < 10000)
    return "$price元";
  else if (price < 100000000 && price >= 10000) {
    price = price ~/ 10000;
    return "$price万";
  } else if (price >= 100000000) {
    price = price ~/ 100000000;
    return "$price亿";
  }
}
