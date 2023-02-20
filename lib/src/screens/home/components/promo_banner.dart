import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_images.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w),
      child: Container(
        height: 90.h,
        width: 327.w,
        margin: EdgeInsets.symmetric(
          vertical: 30.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: const DecorationImage(
              image: AssetImage(homePromoBanner), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
