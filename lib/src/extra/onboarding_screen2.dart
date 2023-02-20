import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/extra/onboarding_controller.dart';
import 'package:shopsy/src/models/onboarding_page_model.dart';
import 'package:shopsy/src/screens/onboarding/components/onboarding_splash_builders.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen2 extends StatelessWidget {
  const OnBoardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingController controller = Get.find();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* -- Page Builder
          SizedBox(
            height: 525.h,
            width: double.maxFinite,
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: onboardingModel.length,
              itemBuilder: ((context, index) {
                return OnboardingPageBuilder(
                  index: index,
                );
              }),
            ),
          ),

          //* -- Dot Indicator
          Obx(
            () => Padding(
              padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
              child: AnimatedSmoothIndicator(
                  activeIndex: controller.curentPageValue.value,
                  count: onboardingModel.isEmpty ? 1 : onboardingModel.length,
                  effect: ExpandingDotsEffect(
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                      radius: 10.r,
                      activeDotColor: AppColors.mainColor,
                      dotColor: AppColors.disableColor)),
            ),
          ),

          //* -- Elevated Button

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        controller.jumpNextPage();
                        controller.naviagateToLogin();
                      },
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: MyTextWidget(
                        title: tContinue,
                        style: Theme.of(context).textTheme.headline3,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
