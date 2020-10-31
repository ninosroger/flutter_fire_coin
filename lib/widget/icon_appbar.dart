import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';

class IconAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(48.0);

  Icon startIcon;
  Icon endIcon;
  String title;

  final Function onStartIconTap;
  final Function onEndIconTap;

  IconAppBar({
    @required this.title,
    this.startIcon,
    this.endIcon,
    this.onStartIconTap,
    this.onEndIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.app_white,
      child: SafeArea(
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: onStartIconTap,
                child: SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: startIcon ?? null,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: Dimens.font_sp20,
                            color: AppColors.text_black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                ),
              ),
              InkWell(
                onTap: onEndIconTap,
                child: SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: endIcon ?? null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
