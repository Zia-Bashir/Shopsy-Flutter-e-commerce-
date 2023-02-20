import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ProfileHeaderLable extends StatelessWidget {
  const ProfileHeaderLable({
    Key? key,
    required this.style,
    required this.label,
  }) : super(key: key);

  final TextTheme style;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            width: 50.w,
            child: const Divider(
              color: AppColors.mainColor,
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: MyTextWidget(
              title: label,
              style: style.headline2
                  ?.copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 50.w,
            child: const Divider(
              color: AppColors.mainColor,
              thickness: 1,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
