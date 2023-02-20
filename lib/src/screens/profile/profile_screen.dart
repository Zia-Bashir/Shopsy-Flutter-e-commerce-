import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/models/profile_model.dart';
import 'package:shopsy/src/screens/profile/components/profile_list_tile.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //* Text
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: MyTextWidget(title: tProfileTitle, style: style.headline5),
            ),

            //* Image Container

            Padding(
              padding: EdgeInsets.only(top: 50.h, bottom: 40.h),
              child: Container(
                height: profilePicContainerHeight,
                width: profilePicContainerWidth,
                decoration: BoxDecoration(
                  color: AppColors.profilePicContainerBg,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),

            //* List Tile

            profileModel.length > 5
                ? SizedBox(
                    height: 450.h,
                    width: 375.w,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: profileModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProfileListTile(
                          style: style,
                          index: index,
                        );
                      },
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: profileModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProfileListTile(
                        style: style,
                        index: index,
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
