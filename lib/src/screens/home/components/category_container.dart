import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/my_icons_icons.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
    required this.icon,
    required this.ontap,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback ontap;
  final String title;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 55.h,
          width: 55.w,
          decoration: BoxDecoration(
              color: AppColors.categoryColor,
              borderRadius: BorderRadius.circular(10.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Material(
              color: AppColors.categoryColor,
              child: InkWell(
                onTap: ontap,
                splashColor: AppColors.mainColor,
                child: Icon(
                  icon,
                  size: icon == MyIcons.discover ? 25.r : 20.r,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        ),
        MyTextWidget(
          title: title,
          style: style.subtitle1,
          line: 2,
        )
      ],
    );
  }
}
