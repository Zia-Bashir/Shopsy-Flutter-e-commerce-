import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/cart_controller.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/utils/my_icons_icons.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class CartBottomSheet extends StatelessWidget {
  CartBottomSheet({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextTheme style;
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 174.h,
      padding:
          EdgeInsets.only(top: 15.h, bottom: 40.h, left: 40.w, right: 20.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, -2),
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10.r),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* ---- Save Voucher ----
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.productBGColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      MyIcons.receipt,
                      color: AppColors.mainColor,
                      size: 20.r,
                    ),
                  ),
                ),
              ),

              //* ---- Add a Voucher ----
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    MyTextWidget(
                      title: tVoucher,
                      style: style.subtitle2
                          ?.copyWith(color: AppColors.secondaryColor),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.secondaryColor,
                      size: 12.r,
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextWidget(
                      title: "Total:",
                      style: style.subtitle2
                          ?.copyWith(color: AppColors.secondaryColor)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => MyTextWidget(
                        title:
                            "\$ ${cartController.totalAmount.value.toStringAsFixed(2).toString()}",
                        style: style.subtitle1?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                  ),

                  // GetBuilder<CartController>(builder: (_) {
                  //   return MyTextWidget(
                  //       title:
                  //           "\$ ${_.totalAmount.value.toStringAsFixed(2).toString()}",
                  //       style: style.subtitle1?.copyWith(
                  //           color: Colors.black, fontWeight: FontWeight.w600));
                  // })
                ],
              ),
              SizedBox(
                width: 190.w,
                child: MyElevatedButtonWidget(
                    text: "CheckOut",
                    ontap: () {
                      cartController.cartLength();
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
