import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopsy/src/utils/app_images.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultPaddingWidth,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* --- Back Button/ LoginSuccess Text

              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: MyTextWidget(
                    title: tLoginSuccessTitle, style: style.headline5),
              ),

              SizedBox(
                height: loginSuccessSizeHeight,
                width: loginSuccessSizeWidth,
                child: Center(
                  child: LottieBuilder.asset(successLottie,
                      height: 400.h,
                      width: 400.w,
                      fit: BoxFit.cover,
                      repeat: false),
                ),
              ),

              //* ---- Login Success Text

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextWidget(
                      title: tLoginSuccessTitle, style: style.headline2),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyTextWidget(
                      title: tLoginSuccessSubtitle, style: style.subtitle1),
                  SizedBox(
                    height: elevatedBetweenSize,
                  ),

                  //* --- Elevated Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90.w),
                    child: MyElevatedButtonWidget(
                        ontap: () {
                          Get.offAllNamed("/navbar");
                        },
                        text: tContinue),
                  )
                ],
              ),

              SizedBox(
                height: defaultPaddingHight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
