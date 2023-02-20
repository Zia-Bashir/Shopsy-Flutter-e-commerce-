import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class OrangeDivider extends StatelessWidget {
  const OrangeDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: const Divider(
        color: AppColors.mainColor,
        thickness: 1,
      ),
    );
  }
}
