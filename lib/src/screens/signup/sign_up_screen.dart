import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopsy/src/screens/signup/components/signup_form.dart';
import 'package:shopsy/src/utils/app_images.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/button_with_text_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              ButtonWithTextWidget(style: style, text: tSignup),
              //* ---- Registered Account Text

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextWidget(title: tSignUpTitle, style: style.headline2),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyTextWidget(title: tSignUpSubTitle, style: style.subtitle1),
                ],
              ),

              //* ---- Form

              const SignUpForm(),

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

              MyTextWidget(title: tTermsAndPolicy, style: style.subtitle1),

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
