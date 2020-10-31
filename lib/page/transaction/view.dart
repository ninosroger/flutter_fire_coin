import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/spaces.dart';
import 'package:flutter_vicoin/util/flutter_toast.dart';
import 'package:flutter_vicoin/widget/icon_appbar.dart';
import 'package:flutter_vicoin/widget/seekbar.dart';
import 'package:flutter_vicoin/widget/transaction_bottom_sheet.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    TransactionState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: GestureDetector(
      onTap: () {
        state.nodePrice.unfocus();
        state.nodeCount.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.app_white,
        appBar: IconAppBar(title: "BTC交易"),
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesome.bars,
                        size: 20,
                      ),
                      Spaces.hSpace4,
                      Text(
                        "BTC",
                        style: TextStyle(
                          fontSize: Dimens.font_sp20,
                          color: AppColors.text_black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spaces.hSpace4,
                      Container(
                        padding: EdgeInsets.all(Dimens.dp2),
                        decoration: BoxDecoration(
                          color: AppColors.background_green,
                          borderRadius:
                              BorderRadius.circular(Dimens.radius_dp4),
                        ),
                        child: Text(
                          "+0.15%",
                          style: TextStyle(
                              color: AppColors.text_green,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Spaces.empty),
                      Icon(
                        MaterialCommunityIcons.chart_gantt,
                        size: 20,
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(Feather.more_horizontal),
                        onSelected: (value) {
                          FlutterToast.show("待开发");
                        },
                        itemBuilder: (context) {
                          return <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: "1",
                              child: Row(
                                children: [
                                  Icon(
                                    Feather.cloud_drizzle,
                                    size: 16,
                                  ),
                                  Spaces.hSpace8,
                                  Text(
                                    "充币",
                                    style: TextStyle(
                                        fontSize: Dimens.font_sp16,
                                        color: AppColors.text_black),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: "2",
                              child: Row(
                                children: [
                                  Icon(
                                    Feather.cloud_lightning,
                                    size: 16,
                                  ),
                                  Spaces.hSpace8,
                                  Text(
                                    "划转",
                                    style: TextStyle(
                                        fontSize: Dimens.font_sp16,
                                        color: AppColors.text_black),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                          ];
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ClipPath(
                                    clipper: LeftRoundedPathClipper(),
                                    child: Container(
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        color: AppColors.text_green,
                                      ),
                                      child: Center(
                                          child: Text(
                                        "买入",
                                        style: TextStyle(
                                            color: AppColors.app_white,
                                            fontSize: Dimens.font_sp14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: ClipPath(
                                    clipper: RightRoundedPathClipper(),
                                    child: Container(
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        color: AppColors.search_background,
                                      ),
                                      child: Center(
                                          child: Text(
                                        "卖出",
                                        style: TextStyle(
                                            color: AppColors.app_light_gray,
                                            fontSize: Dimens.font_sp14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                            Spaces.vSpace10,
                            Container(
                              width: double.infinity,
                              height: 30,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.line_gray),
                                borderRadius: BorderRadius.circular(Dimens.dp4),
                              ),
                              child: DropdownButton(
                                underline: Spaces.empty,
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "限价委托",
                                      style: TextStyle(
                                        color: AppColors.app_light_gray,
                                        fontSize: Dimens.font_sp14,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "市价委托",
                                      style: TextStyle(
                                        color: AppColors.app_light_gray,
                                        fontSize: Dimens.font_sp14,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "止盈止损",
                                      style: TextStyle(
                                        color: AppColors.app_light_gray,
                                        fontSize: Dimens.font_sp14,
                                      ),
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "计划委托",
                                      style: TextStyle(
                                        color: AppColors.app_light_gray,
                                        fontSize: Dimens.font_sp14,
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: (value) {},
                              ),
                            ),
                            Spaces.vSpace10,
                            Container(
                                height: 40,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.line_gray),
                                  borderRadius:
                                      BorderRadius.circular(Dimens.dp4),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        maxLines: 1,
                                        focusNode: state.nodePrice,
                                        keyboardType: TextInputType.number,
                                        enableInteractiveSelection: false,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(8),
                                          MoneyTextInputFormatter()
                                        ],
                                        controller: state.priceController,
                                        style: TextStyle(
                                          fontSize: Dimens.font_sp14,
                                          color: AppColors.text_black,
                                        ),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "价格",
                                            hintStyle: TextStyle(
                                              fontSize: Dimens.font_sp14,
                                              color: AppColors.app_light_gray,
                                            )),
                                      ),
                                    ),
                                    const VerticalDivider(
                                      color: AppColors.line_gray,
                                      width: 1,
                                    ),
                                    InkWell(
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Icon(
                                          MaterialCommunityIcons.minus,
                                          color: AppColors.app_light_gray,
                                          size: 20,
                                        ),
                                      ),
                                      onTap: () => dispatch(
                                          TransactionActionCreator
                                              .onPriceSub()),
                                    ),
                                    const VerticalDivider(
                                      color: AppColors.line_gray,
                                      width: 1,
                                      indent: 10,
                                      endIndent: 10,
                                    ),
                                    InkWell(
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Icon(
                                          MaterialIcons.add,
                                          color: AppColors.app_light_gray,
                                          size: 20,
                                        ),
                                      ),
                                      onTap: () => dispatch(
                                          TransactionActionCreator
                                              .onPriceAdd()),
                                    ),
                                  ],
                                )),
                            Spaces.vSpace4,
                            Container(
                              width: double.infinity,
                              child: Text(
                                "≈0.00 USD",
                                style: TextStyle(
                                    fontSize: Dimens.font_sp11,
                                    color: AppColors.app_light_gray),
                              ),
                            ),
                            Spaces.vSpace10,
                            Container(
                                height: 40,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.line_gray),
                                  borderRadius:
                                      BorderRadius.circular(Dimens.dp4),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        maxLines: 1,
                                        focusNode: state.nodeCount,
                                        keyboardType: TextInputType.number,
                                        enableInteractiveSelection: false,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(8),
                                        ],
                                        controller: state.countController,
                                        style: TextStyle(
                                          fontSize: Dimens.font_sp14,
                                          color: AppColors.text_black,
                                        ),
                                        onChanged: (value) {
                                          dispatch(TransactionActionCreator
                                              .onChangeSelectCountToZero());
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "数量",
                                            hintStyle: TextStyle(
                                              fontSize: Dimens.font_sp14,
                                              color: AppColors.app_light_gray,
                                            )),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text(
                                        "BTC",
                                        style: TextStyle(
                                            fontSize: Dimens.font_sp14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.app_light_gray),
                                      ),
                                    )
                                  ],
                                )),
                            Spaces.vSpace6,
                            Row(
                              children: [
                                Text(
                                  "合计",
                                  style: TextStyle(
                                    fontSize: Dimens.font_sp12,
                                    color: AppColors.app_light_gray,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    width: double.infinity,
                                    child: Text(
                                      "0.00 USD",
                                      style: TextStyle(
                                        fontSize: Dimens.font_sp12,
                                        color: AppColors.app_light_gray,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spaces.vSpace10,
                            Container(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: SeekBar(
                                    progressheight: 2,
                                    value: state.selectCount.toDouble(),
                                    min: 0,
                                    max: 1000,
                                    sectionCount: 5,
                                    sectionRadius: 4,
                                    indicatorRadius: 8,
                                    indicatorColor: AppColors.text_green,
                                    sectionColor: AppColors.text_green,
                                    sectionUnSelecteColor: AppColors.line_gray,
                                    sectionDecimal: 0,
                                    progressColor: AppColors.text_green,
                                    backgroundColor: AppColors.line_gray,
                                    onValueChanged: (value) {
                                      dispatch(TransactionActionCreator
                                          .onUserSelectCount(
                                              value.value.toInt()));
                                    },
                                  )),
                            ),
                            Spaces.vSpace10,
                            Row(
                              children: [
                                Text(
                                  "选择数量",
                                  style: TextStyle(
                                    fontSize: Dimens.font_sp12,
                                    color: AppColors.app_light_gray,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    width: double.infinity,
                                    child: Text(
                                      "${state.selectCount} BTC",
                                      style: TextStyle(
                                        fontSize: Dimens.font_sp12,
                                        color: AppColors.app_light_gray,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spaces.vSpace16,
                            Row(
                              children: [
                                Text(
                                  "交易额",
                                  style: TextStyle(
                                    fontSize: Dimens.font_sp14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.app_light_gray,
                                  ),
                                ),
                                Spaces.hSpace4,
                                Expanded(
                                  child: Text(
                                    "0.00 USD",
                                    style: TextStyle(
                                      fontSize: Dimens.font_sp14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.text_black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Spaces.vSpace10,
                            Container(
                              height: 38,
                              width: double.infinity,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                onPressed: () {},
                                padding: EdgeInsets.all(0),
                                color: AppColors.text_green,
                                child: Text('买入',
                                    style: TextStyle(
                                        fontSize: Dimens.font_sp15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.app_white)),
                              ),
                            ),
                          ],
                        ),
                        flex: 15,
                      ),
                      Spaces.hSpace10,
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    '价格',
                                    style: TextStyle(
                                        fontSize: Dimens.font_sp12,
                                        color: AppColors.app_light_gray),
                                  )),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '数量',
                                          style: TextStyle(
                                              fontSize: Dimens.font_sp12,
                                              color: AppColors.app_light_gray),
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                child: ListView.builder(
                                  itemBuilder: (context, index) => Container(
                                    height: 29,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                '11734.78',
                                                style: TextStyle(
                                                    fontSize: Dimens.font_sp12,
                                                    color:
                                                        AppColors.text_green),
                                              )),
                                        ),
                                        Expanded(
                                          child: Container(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                '6.96001',
                                                style: TextStyle(
                                                    fontSize: Dimens.font_sp12,
                                                    color: AppColors
                                                        .app_light_gray),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  itemCount: 12,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        flex: 10,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: Dimens.dp10,
                  thickness: Dimens.dp10,
                  color: AppColors.app_background_gray,
                ),
                Container(
                  color: AppColors.app_white,
                  alignment: Alignment.bottomLeft,
                  child: TabBar(
                    tabs: state.tabs.map((e) => Text(e)).toList(),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: state.tabController,
                    indicatorColor: AppColors.app_main_blue,
                    unselectedLabelColor: AppColors.app_light_gray,
                    labelColor: AppColors.app_main_blue,
                    labelPadding: EdgeInsets.all(10),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.font_sp16),
                  ),
                ),
                Container(
                  height: 200,
                  child: TabBarView(
                    children: state.tabs
                        .map((e) => Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Stack(children: [
                                Align(
                                  child: Icon(
                                    FontAwesome5.file_alt,
                                    size: 80,
                                    color: AppColors.line_gray,
                                  ),
                                  alignment: AlignmentDirectional.center,
                                ),
                                Align(
                                  child: Icon(
                                    AntDesign.exclamationcircle,
                                    size: 18,
                                    color: AppColors.app_main_blue,
                                  ),
                                  alignment: AlignmentDirectional.bottomEnd,
                                ),
                              ]),
                            )))
                        .toList(),
                    controller: state.tabController,
                  ),
                ),
              ],
            ),
            Align(
              child: Container(
                height: 40,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: AppColors.app_white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.line_gray,
                      blurRadius: 6,
                      spreadRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(child: Text("BTC分时图")),
                    Container(
                      height: 26,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.line_gray),
                        borderRadius: BorderRadius.circular(Dimens.dp4),
                      ),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: viewService.context,
                              builder: (context) {
                                return TransactionBottomSheet();
                              });
                        },
                        child: Row(
                          children: [
                            Text(
                              "展开",
                              style: TextStyle(
                                  color: AppColors.app_gray,
                                  fontSize: Dimens.font_sp12),
                            ),
                            Spaces.hSpace5,
                            Icon(
                              AntDesign.caretup,
                              size: 8,
                              color: AppColors.app_gray,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              alignment: AlignmentDirectional.bottomEnd,
            ),
          ],
        ),
      ),
    ),
  );
}

class MoneyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newValueText = newValue.text;

    if (newValueText == ".") {
      newValueText = "0.";
    } else if (newValueText.contains(".")) {
      if (newValueText.lastIndexOf(".") != newValueText.indexOf(".")) {
        return TextEditingValue(
          text: oldValue.text,
          selection: new TextSelection.collapsed(offset: oldValue.text.length),
        );
      } else if (newValueText.length - 1 - newValueText.indexOf(".") > 2) {
        return TextEditingValue(
          text: oldValue.text,
          selection: new TextSelection.collapsed(offset: oldValue.text.length),
        );
      }
    }
    return TextEditingValue(
      text: newValueText,
      selection: new TextSelection.collapsed(offset: newValueText.length),
    );
  }
}

class LeftRoundedPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width - 10, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RightRoundedPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(10, 0.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
