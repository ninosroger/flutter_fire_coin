import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_vicoin/resources/colors.dart';
import 'package:flutter_vicoin/resources/dimens.dart';
import 'package:flutter_vicoin/resources/spaces.dart';
import 'package:flutter_vicoin/resources/strings.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(48.0);

  SearchBar({
    this.startIconTap,
  });

  Function startIconTap;

  @override
  Widget build(BuildContext context) => Material(
        color: AppColors.app_white,
        child: SafeArea(
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                    startIconTap();
                  },
                  child: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipOval(
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.png',
                          image:
                              'https://www.keaidian.com/uploads/allimg/190427/27154730_0.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 28.0,
                    decoration: BoxDecoration(
                      color: AppColors.search_background,
                      borderRadius: BorderRadius.circular(Dimens.radius_dp14),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spaces.hSpace8,
                          Icon(
                            Feather.search,
                            size: Dimens.dp16,
                            color: AppColors.app_light_gray,
                          ),
                          Spaces.hSpace4,
                          Text(
                            AppStrings.home_search,
                            style: TextStyle(
                              fontSize: Dimens.font_sp12,
                              color: AppColors.app_light_gray,
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      AntDesign.message1,
                      color: AppColors.app_gray,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
