import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:shopsy/src/utils/app_images.dart';

class SuccessToast extends StatelessWidget {
  const SuccessToast({
    Key? key,
    required this.msg,
    this.size = 170,
  }) : super(key: key);

  final String msg;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40.h,
      width: double.maxFinite,
      color: Colors.transparent,
      child: Container(
        width: size!.w,
        //alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(doneLottie,
                repeat: false, reverse: false, height: 30.h, width: 30.w),
            SizedBox(width: 10.w),
            Text(
              msg,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
