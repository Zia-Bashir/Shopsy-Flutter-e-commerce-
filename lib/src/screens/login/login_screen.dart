import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/screens/login/components/login_form.dart';
import 'package:shopsy/src/screens/signup/sign_up_screen.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_images.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              //* --- Signin Text
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: MyTextWidget(title: tSignin, style: style.headline5),
              ),

              //* ---- Welcome Back Text

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextWidget(title: tLoginTitle, style: style.headline2),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyTextWidget(title: tLoginSubTitle, style: style.subtitle1),
                ],
              ),

              //* ---- Form

              const LoginForm(),

              //* --- Social Media Signin

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    fbIcon,
                    width: 60.w,
                    height: 60.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    gIcon,
                    width: 60.w,
                    height: 60.h,
                  ),
                ],
              ),

              //* ---- Dont Have Account

              RichText(
                  text: TextSpan(
                      text: tDontHaveAnAccount,
                      style: style.headline6,
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() =>
                              const SignUpScreen()), //Get.toNamed("/signup"),
                        text: tSignup,
                        style: style.headline5
                            ?.copyWith(color: AppColors.mainColor))
                  ])),

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
