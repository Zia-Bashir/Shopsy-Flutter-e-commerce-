import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/screens/forget%20password/forget_password_screen.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_text.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(() => const ForgetPasswordScreen());
      },
      child: Text(tForgetPassword,
          style: style.subtitle1?.copyWith(
              color: AppColors.mainColor,
              decoration: TextDecoration.underline)),
    );
  }
}
