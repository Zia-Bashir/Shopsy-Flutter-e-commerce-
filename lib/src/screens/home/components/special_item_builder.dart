import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/models/special_foryou_model.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class SpecialItemsBuilder extends StatelessWidget {
  const SpecialItemsBuilder({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: specialModel.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(right: 13.w),
          height: 100.h,
          width: 242.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
                image: AssetImage(specialModel[index].imgUrl!),
                fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              Container(
                height: 100.h,
                width: 242.w,
                padding: EdgeInsets.only(top: 15.h, left: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(colors: [
                    AppColors.specialProductColor1,
                    AppColors.specialProductColor2
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyTextWidget(
                      title: specialModel[index].title!,
                      style: style.headline3?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MyTextWidget(
                        title: specialModel[index].brands!,
                        style: style.subtitle1?.copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
