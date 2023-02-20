import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/screens/check%20out/components/checkout_bottom_sheet.dart';
import 'package:shopsy/src/screens/check%20out/components/checkout_cart_list.dart';
import 'package:shopsy/src/screens/check%20out/components/checkout_lable.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_images.dart';
import 'package:shopsy/src/utils/app_text.dart';

import '../../widgets/mytext_widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //* --- Cart Text with Back Button
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyTextWidget(
                          title: tCheckOut,
                          style:
                              style.headline5?.copyWith(color: Colors.black)),
                      StreamBuilder(
                        stream: cartProductRF
                            .doc(authCurrentUser)
                            .collection("products")
                            .snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Container();
                          } else {
                            return MyTextWidget(
                                title:
                                    "${snapshot.data!.docs.length.toString()} Items",
                                style: style.subtitle2?.copyWith(
                                    color: AppColors.secondaryColor));
                          }
                        },
                      ),
                    ],
                  ),
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
            ),

            SizedBox(
              height: 40.h,
            ),

            //* ---- Scroll ---
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* ---- Cart ---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* --- Cart Lable ---
                        CheckOutLable(
                          onTap: () {
                            Get.toNamed("/cart");
                          },
                          title: tCart,
                          text: tViewAll,
                          style: style,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        //* --- Cart List Builder ---
                        const CheckOutCartList(),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),

                    //* --- Your Address ---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* --- Address Lable ---
                        CheckOutLable(
                          onTap: () {
                            Get.toNamed("/address");
                          },
                          title: tYourAddress,
                          text: tEditAddress,
                          style: style,
                        ),

                        //* --- Address ---
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 12.h, bottom: 24.h),
                          child: StreamBuilder(
                            stream: userRF.doc(authCurrentUser).snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: Loading(
                                    isContainer: false,
                                  ),
                                );
                              } else {
                                var deliveryAddress =
                                    snapshot.data['deliveryAddress'];
                                if (deliveryAddress == null) {
                                  return DottedBorder(
                                    color: const Color.fromARGB(
                                        255, 176, 176, 176),
                                    strokeWidth: 1,
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(10.r),
                                    child: Container(
                                      height: 45.h,
                                      width: double.maxFinite,
                                      color: AppColors.productBGColor,
                                      child: Center(
                                        child: MyTextWidget(
                                            title: "Add Your Address",
                                            style: style.headline5),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    width: double.maxFinite,
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        snapshot.data['deliveryAddress'],
                                        style: style.subtitle2
                                            ?.copyWith(fontSize: 14.sp)),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    //* --- Shipping Options---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* --- Shipping Lable ---
                        CheckOutLable(
                          onTap: () {
                            Get.toNamed("/cart");
                          },
                          title: tShippingOption,
                          text: tChooseService,
                          style: style,
                        ),

                        //* --- Shipping Selected ---
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 12.h, bottom: 24.h),
                          child: Row(
                            children: [
                              Container(
                                height: 52.h,
                                width: 66.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: AppColors.productBGColor,
                                  image: const DecorationImage(
                                      image: AssetImage(ps5Controller)),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  MyTextWidget(
                                      title: "\$ 161.99",
                                      style: style.subtitle1?.copyWith(
                                          color: AppColors.mainColor)),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  MyTextWidget(
                                      title:
                                          "Will be received on July 12, 2023",
                                      style: style.subtitle1),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    //* --- Payment Method ---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* --- Payment Lable ---
                        CheckOutLable(
                          onTap: () {
                            Get.toNamed("/cart");
                          },
                          title: tPaymentMeyhod,
                          text: tViewAll,
                          style: style,
                        ),

                        //* --- Payment Selected ---
                        Padding(
                            padding: EdgeInsets.only(
                                left: 24.w,
                                right: 24.w,
                                top: 12.h,
                                bottom: 24.h),
                            child: Container(
                              width: 66.w,
                              height: 52.h,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(stripeIcon)),
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: AppColors.productBGColor),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CheckOutBottomSheet(style: style),
    );
  }
}
