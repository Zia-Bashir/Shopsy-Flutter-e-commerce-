import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/screens/otp/components/otp_input_fields.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //* --- SignUp Text
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 56.h),
                    child:
                        MyTextWidget(title: tOtpTitle, style: style.headline5),
                  ),
                  //* ---- OTP Verifcation Text
                  MyTextWidget(title: tOtpTitle, style: style.headline2),
                  SizedBox(
                    height: 10.h,
                  ),
                  RichText(
                      text: TextSpan(
                          text: tOtpSubTitle1,
                          style: style.subtitle1,
                          children: [
                        TextSpan(
                          text: "m.zi******om",
                          style: style.subtitle1,
                        ),
                      ])),
                  RichText(
                    text: TextSpan(
                        text: tOtpSubTitle2,
                        style: style.subtitle1,
                        children: [
                          TextSpan(
                            text: " 00:30",
                            style: style.subtitle1?.copyWith(color: Colors.red),
                          ),
                        ]),
                  ),
                ],
              ),

              //* Pin Input Fields
              const FractionallySizedBox(
                  widthFactor: 1, child: OtpInputFields()),

              //* Elevated Button

              MyElevatedButtonWidget(ontap: () {}, text: tContinue),

              //* Resend Otp Text

              MyTextWidget(
                  title: tResendOtp,
                  style: style.subtitle1
                      ?.copyWith(decoration: TextDecoration.underline)),

              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
