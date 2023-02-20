import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/popular_product_controller.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.id,
    this.proId,
  });

  final int id;
  final String? proId;

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.h, bottom: 20.h, left: 24.w, right: 24.w),
        child: Container(
          height: preferredSize.height,
          color: Colors.transparent,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: 18.sp,
                    )),
              ),
            ),
            GetBuilder<PopularProductController>(builder: (controller) {
              controller.getProductRating(proId);
              return Container(
                height: 28.h,
                width: 64.w,
                padding: EdgeInsets.only(right: 5.w, left: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyTextWidget(
                        title: controller.ratingValue.value.toString(),
                        style: style.subtitle1),
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              );
            })
          ]),
        ),
      ),
    );
  }
}
