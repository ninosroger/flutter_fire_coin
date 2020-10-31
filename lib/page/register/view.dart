import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/spaces.dart';
import 'package:flutter_vicoin/route/router_utils.dart';
import 'package:flutter_vicoin/widget/icon_appbar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RegisterState state, Dispatch dispatch, ViewService viewService) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle.dark,
    child: GestureDetector(
      onTap: () {
        state.inviteNode.unfocus();
        state.phoneNode.unfocus();
        state.codeNode.unfocus();
        state.passwordNode.unfocus();
        state.confirmNode.unfocus();
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
                        "手机注册",
                        style: TextStyle(
                            color: AppColors.text_black,
                            fontSize: Dimens.font_sp28,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Spaces.vSpace4,
                  Row(
                    children: [
                      Container(
                        child: Icon(
                          Ionicons.md_information_circle_outline,
                          size: 16,
                          color: AppColors.text_red,
                        ),
                      ),
                      Spaces.hSpace4,
                      Text(
                        "以下信息均为必填！",
                        style: TextStyle(
                            color: AppColors.text_red,
                            fontSize: Dimens.font_sp14),
                      ),
                    ],
                  ),
                  Spaces.vSpace20,
                  TextField(
                    maxLines: 1,
                    focusNode: state.phoneNode,
                    keyboardType: TextInputType.phone,
                    enableInteractiveSelection: false,
                    controller: state.phoneController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                    ],
                    style: TextStyle(
                      fontSize: Dimens.font_sp16,
                      color: AppColors.text_black,
                    ),
                    decoration: InputDecoration(
                        suffix: SizedBox(
                          height: 34,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            onPressed: () {},
                            padding: EdgeInsets.all(0),
                            color: AppColors.app_main_blue,
                            child: Text("获取验证码",
                                style: TextStyle(
                                    fontSize: Dimens.font_sp12,
                                    color: AppColors.app_white)),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            dispatch(RegisterActionCreator.onClearPhone());
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
                  ),
                  Spaces.vSpace20,
                  TextField(
                    maxLines: 1,
                    focusNode: state.codeNode,
                    keyboardType: TextInputType.phone,
                    enableInteractiveSelection: false,
                    controller: state.codeController,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    style: TextStyle(
                      fontSize: Dimens.font_sp16,
                      color: AppColors.text_black,
                    ),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            dispatch(RegisterActionCreator.onClearCode());
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
                        hintText: "请输入验证码",
                        hintStyle: TextStyle(
                          fontSize: Dimens.font_sp16,
                          color: AppColors.app_light_gray,
                        )),
                  ),
                  Spaces.vSpace20,
                  TextField(
                    maxLines: 1,
                    focusNode: state.passwordNode,
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
                                RegisterActionCreator.onChangePwdShowState());
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
                  ),
                  Spaces.vSpace20,
                  TextField(
                    maxLines: 1,
                    focusNode: state.confirmNode,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !state.isShowConfirm,
                    enableInteractiveSelection: false,
                    style: TextStyle(
                      fontSize: Dimens.font_sp16,
                      color: AppColors.text_black,
                    ),
                    controller: state.confirmController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            dispatch(RegisterActionCreator
                                .onChangeConfirmShowState());
                          },
                          icon: state.isShowConfirm
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
                        hintText: "请确认密码",
                        hintStyle: TextStyle(
                          fontSize: Dimens.font_sp16,
                          color: AppColors.app_light_gray,
                        )),
                  ),
                  Spaces.vSpace20,
                  TextField(
                    maxLines: 1,
                    focusNode: state.inviteNode,
                    keyboardType: TextInputType.emailAddress,
                    enableInteractiveSelection: false,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                    controller: state.inviteController,
                    style: TextStyle(
                      fontSize: Dimens.font_sp16,
                      color: AppColors.text_black,
                    ),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            dispatch(RegisterActionCreator.onClearInvite());
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
                        hintText: "请输入邀请码",
                        hintStyle: TextStyle(
                          fontSize: Dimens.font_sp16,
                          color: AppColors.app_light_gray,
                        )),
                  ),
                  Spaces.vSpace40,
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    onPressed: () {
                      state.inviteNode.unfocus();
                      state.phoneNode.unfocus();
                      state.codeNode.unfocus();
                      state.passwordNode.unfocus();
                      state.confirmNode.unfocus();
                      dispatch(RegisterActionCreator.onRegisterAccount());
                    },
                    padding: EdgeInsets.all(12),
                    color: AppColors.app_main_blue,
                    child: Text("注册",
                        style: TextStyle(
                            fontSize: Dimens.font_sp16,
                            color: AppColors.app_white)),
                  ),
                  Spaces.vSpace20,
                  Spaces.vSpace40,
                ],
              ),
              Align(
                child: InkWell(
                  onTap: () {
                    FluroNavigator.goBack(viewService.context);
                  },
                  child: Container(
                    color: AppColors.app_white,
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "已有Huobi账号？",
                          style: TextStyle(
                              color: AppColors.app_light_gray,
                              fontSize: Dimens.font_sp14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "登录",
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