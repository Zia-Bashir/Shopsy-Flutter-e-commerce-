import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/controllers/popular_product_controller.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/screens/productdetail/components/incre_decrement_container.dart';
import 'package:shopsy/src/screens/productdetail/components/product_details.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_toast.dart';
import 'package:shopsy/src/widgets/favourite_button_widget.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';
import 'package:shopsy/src/widgets/success_toast.dart';

import 'components/custom_app_bar.dart';
import 'components/product_image_container.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.pageId, this.productId});

  final int pageId;
  final String? productId;
  final controller = PopularProductController();
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.productBGColor,
      appBar: CustomAppBar(id: pageId, proId: productId),
      body: SizedBox(
        height: 630.h,
        width: screenWidth,
        child: Column(
          children: [
            //* -- Product Image Container
            SizedBox(
              height: 280.h,
              width: screenWidth,
              child: ProductImageContainer(id: pageId, proId: productId),
            ),
            //* ------- Product Details --------

            Container(
              height: 400.h,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: Stack(
                children: [
                  //* --- Product Details
                  ProductDetails(pageId: pageId, style: style),

                  //* --- Favourite Button
                  Positioned(
                    top: 56.h,
                    right: 0,
                    child: Container(
                      height: 50.h,
                      width: 64.w,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r)),
                      ),
                      child: FavouriteButtonWidget(
                        proId: productId,
                        productIndex: pageId,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //* -- Item Selection Bottom Sheet
      bottomSheet: Material(
        color: Colors.white,
        child: Container(
          height: 210.h,
          width: screenWidth,
          decoration: BoxDecoration(
            color: AppColors.productBGColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //* -- Color and Product Selection
              Padding(
                padding: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //* Color Slection
                    SizedBox(
                      height: 40.h,
                      child: StreamBuilder(
                        stream: popularProductsRF
                            .doc(productId)
                            .collection("ProductColors")
                            .snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: Loading(
                                isContainer: false,
                              ),
                            );
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  String productColor =
                                      snapshot.data!.docs[index]['color'];
                                  //* -- Product Select Color

                                  controller
                                      .productSelectedColor.value = snapshot
                                          .data!
                                          .docs[controller.selectedColor.value]
                                      ['color'];
                                  return Obx((() => GestureDetector(
                                        onTap: () {
                                          controller.selectColor(index);
                                          //* -- Product Select Color

                                          controller
                                                  .productSelectedColor.value =
                                              snapshot.data!.docs[controller
                                                  .selectedColor
                                                  .value]['color'];
                                        },
                                        child: Container(
                                          height: 40.h,
                                          width: 40.w,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(right: 1.w),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: controller.selectedColor
                                                            .value ==
                                                        index
                                                    ? AppColors.mainColor
                                                    : Colors.transparent),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Container(
                                            height: 24.h,
                                            width: 24.w,
                                            decoration: BoxDecoration(
                                                color: Color(
                                                    int.parse(productColor)),
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(2, 5),
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      blurRadius: 10.r),
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(-2, -5),
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                      blurRadius: 10.r),
                                                ]),
                                          ),
                                        ),
                                      )));
                                });
                          }
                        },
                      ),
                    ),

                    //* -- Product Quantity
                    Row(
                      children: [
                        IncreDecrementContainer(
                          ontap: () {
                            controller.setQuantity(false);
                          },
                          icon: Icons.remove,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Obx(
                            (() => MyTextWidget(
                                  title: controller.quantity.value.toString(),
                                  style: style.headline3
                                      ?.copyWith(color: Colors.black),
                                )),
                          ),
                        ),
                        IncreDecrementContainer(
                          ontap: () {
                            controller.setQuantity(true);
                          },
                          icon: Icons.add,
                          shadow: [
                            BoxShadow(
                                offset: const Offset(2, 5),
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5.r)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //* -- Add to Cart

              Container(
                height: 130.h,
                width: screenWidth,
                padding: EdgeInsets.only(top: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyElevatedButtonWidget(
                        text: "Add to Cart",
                        ontap: () {
                          popularProductsRF
                              .doc(productId)
                              .get()
                              .then((DocumentSnapshot doc) {
                            double productPrice = doc['price'];
                            print("----------------$productPrice");
                            controller.addedToCart(
                                productId: productId!,
                                productIndex: pageId,
                                productColor: controller.getColor,
                                quantity: controller.getQuantity,
                                productPrice: productPrice);
                          });

                          showToast(context,
                              const SuccessToast(msg: "Added to Cart"));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
