import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.hintText = '',
    required this.icon,
    this.color = AppColors.mainColor,
    required this.lable,
    this.obsureText = false,
    this.validator,
    this.keyboard,
    this.maxLine = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final IconData icon;
  final Color color;
  final String lable;
  final int? maxLine;
  final bool? obsureText;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: TextFormField(
            maxLines: maxLine,
            keyboardType: keyboard,
            controller: controller,
            obscureText: obsureText!,
            validator: validator,
            decoration: InputDecoration(
                hintText: hintText,
                label: Text(lable),
                suffixIcon: Icon(icon),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.mainColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.secondaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.secondaryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.mainColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide:
                      const BorderSide(width: 2, color: AppColors.mainColor),
                ),
                errorStyle: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: AppColors.mainColor)),
          ),
        ),
        SizedBox(
          height: 30.h,
        )
      ],
    );
  }
}
