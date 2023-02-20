import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class IncreDecrementContainer extends StatelessWidget {
  const IncreDecrementContainer({
    Key? key,
    required this.icon,
    required this.ontap,
    this.shadow,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback ontap;
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: shadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: ontap,
            splashColor: AppColors.mainColor,
            child: Icon(
              icon,
              color: AppColors.secondaryColor,
              size: 20.r,
            ),
          ),
        ),
      ),
    );
  }
}
