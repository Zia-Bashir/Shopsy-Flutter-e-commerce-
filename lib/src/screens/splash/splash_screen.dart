import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/splash_screen_controller.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.find();
    splashController.startAnimation();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200.w,
          height: 200.h,
          child: Stack(
            children: [
              Obx(
                () => AnimatedPositioned(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 1000),
                  top: splashController.animate.value ? 10.h : 35.h,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    logoLeft,
                    color: AppColors.mainColor,
                    height: 120.h,
                    width: 120.w,
                  ),
                ),
              ),
              Obx(
                () => AnimatedPositioned(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 1000),
                  top: splashController.animate.value ? 60.h : 35.h,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    logoRight,
                    color: AppColors.mainColor,
                    height: 120.h,
                    width: 120.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
