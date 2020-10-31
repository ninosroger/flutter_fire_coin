import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/spaces.dart';
import 'package:flutter_vicoin/route/router_utils.dart';
import 'package:flutter_vicoin/route/routers.dart';
import 'package:flutter_vicoin/widget/icon_appbar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: GestureDetector(
      onTap: () {
        state.nodeAccount.unfocus();
        state.nodePassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.app_white,
        appBar: IconAppBar(
            startIcon: Icon(
              AntDesign.left,
              size: 18,
              color: AppColors.app_light_gray,
            ),
            onStartIconTap: () {
              FluroNavigator.goBack(viewService.context);
            },
            title: ""),
        body: Container(
          padding: EdgeInsets.all(30),
          color: AppColors.app_white,
          child: Stack(
            children: [
              ListView(
                children: [
                  Row(
                    children: [
                      Text(
                        "Huobi Global",
                        style: TextStyle(
                            color: AppColors.text_black,
                            fontSize: Dimens.font_sp28,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Spaces.vSpace4,
                  Text(
                    "登录Huobi",
                    style: TextStyle(
                        color: AppColors.app_light_gray,
                        fontSize: Dimens.font_sp14),
                  ),
                  Spaces.vSpace50,
                  TextField(
                      maxLines: 1,
                      focusNode: state.nodeAccount,
                      keyboardType: TextInputType.phone,
                      enableInteractiveSelection: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      controller: state.accountController,
                      style: TextStyle(
                        fontSize: Dimens.font_sp16,
                        color: AppColors.text_black,
                      ),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              dispatch(LoginActionCreator.onClearAccount());
                            },
                            icon: Icon(
                              Ionicons.md_close_circle,
                              size: 18,
                              color: AppColors.app_light_gray,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.app_main_blue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.line_gray)),
                          hintText: "请输入手机号",
                          hintStyle: TextStyle(
                            fontSize: Dimens.font_sp16,
                            color: AppColors.app_light_gray,
                          )),
                      onChanged: (value) {
                        state.account = value;
                      }),
                  Spaces.vSpace20,
                  TextField(
                      maxLines: 1,
                      focusNode: state.nodePassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !state.isShowPwd,
                      enableInteractiveSelection: false,
                      style: TextStyle(
                        fontSize: Dimens.font_sp16,
                        color: AppColors.text_black,
                      ),
                      controller: state.passwordController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              dispatch(
                                  LoginActionCreator.onChangePwdShowState());
                            },
                            icon: state.isShowPwd
                                ? Icon(
                                    Entypo.eye,
                                    size: 16,
                                    color: AppColors.app_light_gray,
                                  )
                                : Icon(
                                    Entypo.eye_with_line,
                                    size: 16,
                                    color: AppColors.app_light_gray,
                                  ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.app_main_blue)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.line_gray)),
                          hintText: "请输入密码",
                          hintStyle: TextStyle(
                            fontSize: Dimens.font_sp16,
                            color: AppColors.app_light_gray,
                          )),
                      onChanged: (value) {
                        state.password = value;
                      }),
                  Spaces.vSpace40,
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    onPressed: () {
                      state.nodeAccount.unfocus();
                      state.nodePassword.unfocus();
                      dispatch(LoginActionCreator.onLogin());
                    },
                    padding: EdgeInsets.all(12),
                    color: AppColors.app_main_blue,
                    child: Text("登录",
                        style: TextStyle(
                            fontSize: Dimens.font_sp16,
                            color: AppColors.app_white)),
                  ),
                  Spaces.vSpace20,
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "忘记密码",
                      style: TextStyle(
                          color: AppColors.app_main_blue,
                          fontSize: Dimens.font_sp14),
                    ),
                  ),
                  Spaces.vSpace20,
                  Spaces.vSpace40,
                ],
              ),
              Align(
                child: InkWell(
                  onTap: () {
                    FluroNavigator.push(viewService.context, Routers.register);
                  },
                  child: Container(
                    color: AppColors.app_white,
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "还没有Huobi账号？",
                          style: TextStyle(
                              color: AppColors.app_light_gray,
                              fontSize: Dimens.font_sp14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "注册",
                          style: TextStyle(
                              color: AppColors.app_main_blue,
                              fontSize: Dimens.font_sp14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                alignment: AlignmentDirectional.bottomEnd,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
