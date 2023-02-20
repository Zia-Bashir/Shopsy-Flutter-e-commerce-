import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/screens/completeProfile/components/complete_signup_form.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

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
              //* --- SignUp Text
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: MyTextWidget(title: tSignup, style: style.headline5),
              ),
              //* ---- Complete Profile Text

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextWidget(
                      title: tCompleteSignUpTitle, style: style.headline2),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyTextWidget(title: tSignUpSubTitle, style: style.subtitle1),
                ],
              ),

              //* ---- Form

              const CompleteSignUpForm(),

              //* ---- Terms & Policy

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
