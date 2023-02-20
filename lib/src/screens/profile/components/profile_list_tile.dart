import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopsy/src/models/profile_model.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.style,
    required this.index,
  }) : super(key: key);

  final TextTheme style;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: listTileHeight,
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: 24.h, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
          color: AppColors.listTileContainer,
          borderRadius: BorderRadius.circular(15.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Material(
          color: AppColors.listTileContainer,
          child: InkWell(
            onTap: profileModel[index].ontap,
            splashColor: AppColors.mainColor,
            child: Container(
              height: listTileHeight,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        profileModel[index].icon,
                        height: 22.h,
                        width: 22.w,
                      ),
                      SizedBox(
                        width: 26.w,
                      ),
                      MyTextWidget(
                          title: profileModel[index].title,
                          style: style.headline6),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
