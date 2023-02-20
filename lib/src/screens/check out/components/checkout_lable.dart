import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class CheckOutLable extends StatelessWidget {
  const CheckOutLable({
    Key? key,
    required this.style,
    required this.onTap,
    required this.title,
    required this.text,
  }) : super(key: key);

  final TextTheme style;
  final VoidCallback onTap;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyTextWidget(
              title: title,
              style: style.headline5?.copyWith(color: Colors.black)),
          GestureDetector(
              onTap: onTap,
              child: MyTextWidget(title: text, style: style.subtitle1)),
        ],
      ),
    );
  }
}
