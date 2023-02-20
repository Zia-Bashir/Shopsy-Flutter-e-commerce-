import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class AppBarButtonWidget extends StatelessWidget {
  const AppBarButtonWidget({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.child,
  }) : super(key: key);

  final VoidCallback ontap;
  final IconData icon;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 46.h,
          width: 46.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.seachBarColor,
          ),
          child: Center(
            child: IconButton(
                onPressed: ontap,
                icon: Icon(
                  icon,
                  color: AppColors.secondaryColor,
                  size: 18.r,
                )),
          ),
        ),
        Positioned(
          right: -2.w,
          top: -2.h,
          child: Container(
            height: 16.h,
            width: 16.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              shape: BoxShape.circle,
              color: AppColors.mainColor,
            ),
            child: Center(child: child),
          ),
        ),
      ],
    );
  }
}
