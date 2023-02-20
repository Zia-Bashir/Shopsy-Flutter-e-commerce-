import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/screens/changePassword/components/password_form.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/button_with_text_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
              ButtonWithTextWidget(style: style, text: tChangePassword),
              //* ---- Forget Password Text

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyTextWidget(title: tChangePassword, style: style.headline2),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyTextWidget(
                      title: tEnterNewPassword, style: style.subtitle1),
                  SizedBox(
                    height: defaultPaddingHight,
                  ),
                  //* ---- Form

                  const PasswordForm(),
                ],
              ),

              SizedBox(
                height: defaultPaddingHight * 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
