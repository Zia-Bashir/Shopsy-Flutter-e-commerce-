import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ButtonWithTextWidget extends StatelessWidget {
  const ButtonWithTextWidget({
    Key? key,
    required this.style,
    required this.text,
  }) : super(key: key);

  final TextTheme style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
              size: 30.r,
            ),
          ),
          MyTextWidget(title: text, style: style.headline5),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.transparent,
              size: 30.r,
            ),
          ),
        ],
      ),
    );
  }
}
