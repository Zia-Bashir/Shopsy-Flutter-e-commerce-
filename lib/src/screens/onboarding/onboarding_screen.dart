import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/models/onboarding_page_model.dart';
import 'package:shopsy/src/screens/login/login_screen.dart';
import 'package:shopsy/src/screens/onboarding/components/onboarding_splash_builders.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(viewportFraction: 1);
  var _curentPageValue = 0.0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _pageController.addListener((() {
      setState(() {
        _curentPageValue = _pageController.page!;
      });
    }));
  }

  @override
  void dispose() {
    // ignore: todo
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              controller: _pageController,
              itemCount: onboardingModel.length,
              itemBuilder: ((context, index) {
                return OnboardingPageBuilder(
                  index: index,
                );
              }),
            ),
          ),

          //* -- Dot Indicator
          Padding(
            padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
            child: AnimatedSmoothIndicator(
                activeIndex: _curentPageValue.toInt(),
                count: onboardingModel.isEmpty ? 1 : onboardingModel.length,
                effect: ExpandingDotsEffect(
                    dotHeight: 10.h,
                    dotWidth: 10.w,
                    radius: 10.r,
                    activeDotColor: AppColors.mainColor,
                    dotColor: AppColors.disableColor)),
          ),

          //* -- Elevated Button

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: MyElevatedButtonWidget(
                ontap: () {
                  setState(() {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);

                    if (_curentPageValue == 2) {
                      //Get.offAllNamed("/login");
                      Get.offAll(() => const LoginScreen());
                    }
                  });
                },
                text: tContinue),
          )
        ],
      ),
    );
  }
}
