import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shopsy/src/utils/app_images.dart';

class LoadingDialoge {
  showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2, 5),
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10.r),
                    BoxShadow(
                        offset: const Offset(2, -5),
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 10.r)
                  ]),
              child: Center(
                child: Lottie.asset(loadingLottie,
                    repeat: true, fit: BoxFit.contain),
              ),
            ),
          ),
        );
      },
    );
  }
}
