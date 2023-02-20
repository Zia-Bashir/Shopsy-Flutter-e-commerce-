import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/cart_controller.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/screens/cart/components/cart_bottom_sheet.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_text.dart';

import '../../widgets/mytext_widget.dart';
import 'components/cart_list_builder.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
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
                            title: tCart,
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

              //* ---- Cart List Builder

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const CartListBuilder(),
                  ),
                ),
              ),
            ],
          ),
        ),

        //* ---- Bottom Sheet ----
        bottomSheet: CartBottomSheet(style: style));
  }
}
