import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopsy/src/widgets/mytext_widget.dart';

class ExpandedText extends StatelessWidget {
  const ExpandedText({
    Key? key,
    required this.style,
    required this.description,
  }) : super(key: key);

  final TextTheme style;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 272.w,
      child: MyTextWidget(
        line: 3,
        title: description,
        style: style.subtitle1,
        align: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
