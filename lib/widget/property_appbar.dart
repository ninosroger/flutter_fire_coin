import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/spaces.dart';
import 'package:flutter_vicoin/resources/strings.dart';

class PropertyBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(48.0);

  @override
  Widget build(BuildContext context) => Material(
        color: AppColors.app_white,
        child: SafeArea(
          child: Container(
            height: 48,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: AppColors.own_blue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.own_light_blue,
                      border: Border.all(color: Colors.blue[800]),
                      borderRadius: BorderRadius.circular(Dimens.dp5),
                    ),
                    child: FlatButton(
                      height: 30,
                      onPressed: () {},
                      padding: EdgeInsets.all(0),
                      color: AppColors.own_light_blue,
                      child: Text('充币',
                          style: TextStyle(
                              fontSize: Dimens.font_sp12,
                              color: AppColors.app_white)),
                    ),
                  ),
                ),
                Spaces.hSpace10,
                Expanded(
                  child: Container(
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.own_light_blue,
                      border: Border.all(color: Colors.blue[800]),
                      borderRadius: BorderRadius.circular(Dimens.dp5),
                    ),
                    child: FlatButton(
                      height: 30,
                      onPressed: () {},
                      padding: EdgeInsets.all(0),
                      color: AppColors.own_light_blue,
                      child: Text('提币',
                          style: TextStyle(
                              fontSize: Dimens.font_sp12,
                              color: AppColors.app_white)),
                    ),
                  ),
                ),
                Spaces.hSpace10,
                Expanded(
                  child: Container(
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.own_light_blue,
                      border: Border.all(color: Colors.blue[800]),
                      borderRadius: BorderRadius.circular(Dimens.dp5),
                    ),
                    child: FlatButton(
                      height: 30,
                      onPressed: () {},
                      padding: EdgeInsets.all(0),
                      color: AppColors.own_light_blue,
                      child: Text('划转',
                          style: TextStyle(
                              fontSize: Dimens.font_sp12,
                              color: AppColors.app_white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
