import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class SeeMoreTextWidget extends StatelessWidget {
  const SeeMoreTextWidget({
    Key? key,
    required this.style,
    required this.ontap,
    required this.text,
  }) : super(key: key);

  final TextTheme style;
  final VoidCallback ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, top: 10.h, bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTextWidget(
            title: text,
            style: style.headline3?.copyWith(color: Colors.black),
          ),

          //? --OnTap
          GestureDetector(
            onTap: ontap,
            child: MyTextWidget(
              title: tSeeMore,
              style: style.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
