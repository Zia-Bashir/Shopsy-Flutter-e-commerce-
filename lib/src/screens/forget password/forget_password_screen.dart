import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/screens/forget%20password/components/mail_form.dart';
import 'package:shopsy/src/screens/signup/sign_up_screen.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/button_with_text_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
              //* --- Back Button/ SignUp Text
              ButtonWithTextWidget(style: style, text: tForgetPassword),

              //* ---- Forget Password Text

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextWidget(
                      title: tForgetPasswordTitle, style: style.headline2),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyTextWidget(
                      title: tForgetPasswordSubTitle, style: style.subtitle1),
                ],
              ),

              //* ---- Form

              const MailForm(),

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
