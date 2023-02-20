import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/controllers/cart_controller.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_images.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_toast.dart';
import 'package:shopsy/src/utils/my_icons_icons.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';
import 'package:shopsy/src/widgets/success_toast.dart';

class CartListBuilder extends StatelessWidget {
  const CartListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    CartController controller = CartController();

    //* ---- Stream Cart Products -----
    return StreamBuilder(
      stream:
          cartProductRF.doc(authCurrentUser).collection("products").snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Loading(
            isContainer: false,
          );
        } else {
          if (snapshot.data!.docs.length == 0) {
            return SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(emptyLottie),
                ],
              ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot cartDocument = snapshot.data!.docs[index];
                int productIndex = cartDocument['productIndex'];
                String productId = cartDocument['productId'];

                //* ---- Stream Popular Products -----
                return StreamBuilder(
                  stream: popularProductsRF.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Loading(
                        isContainer: false,
                      );
                    } else {
                      //? ---- Parent Document SnapShot -----
                      DocumentSnapshot parentDocument =
                          snapshot.data!.docs[productIndex];
                      String selectedColor =
                          cartDocument['productColor'].toString();

                      //? ---- Dismissible from Cart -----
                      return Dismissible(
                        key: Key(productId),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          controller.reomoveFromCart(productId);
                          controller.productTotalAmount();
                          showToast(
                              context,
                              const SuccessToast(
                                msg: "Removed from Favourite",
                                size: 210,
                              ));
                        },
                        background: Container(
                          padding: EdgeInsets.only(right: 15.w),
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Row(
                            children: const [
                              Spacer(),
                              Icon(
                                MyIcons.trash,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 24.h),
                          height: 100.h,
                          width: screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //* ---- Stream Products Images -----
                              StreamBuilder(
                                stream: parentDocument.reference
                                    .collection("ProductImages")
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData) {
                                    return SizedBox(
                                      height: 200.h,
                                      child: const Center(
                                        child: Loading(
                                          isContainer: false,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      height: 100.h,
                                      width: 88.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.productBGColor,
                                        borderRadius: BorderRadius.circular(15),

                                        //? ---- Network Image -----
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data!.docs[0]['image']),
                                            fit: BoxFit.contain),
                                      ),
                                    );
                                  }
                                },
                              ),

                              SizedBox(
                                width: 15.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //? ---- Product Title -----
                                  SizedBox(
                                    width: 223.w,
                                    child: MyTextWidget(
                                      title: snapshot
                                          .data!.docs[productIndex]['title']
                                          .toString(),
                                      style: style.subtitle2,
                                      line: 2,
                                      overflow: TextOverflow.ellipsis,
                                      align: TextAlign.start,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //? ---- Product Color -----
                                      Container(
                                        height: 14.h,
                                        width: 14.w,
                                        decoration: BoxDecoration(
                                            color:
                                                Color(int.parse(selectedColor)),
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(2, 5),
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 3.r)
                                            ]),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          //? ---- Product Price -----
                                          MyTextWidget(
                                            title:
                                                "\$${snapshot.data!.docs[productIndex]['price'].toString()}",
                                            style: style.headline3?.copyWith(
                                                color: AppColors.mainColor,
                                                fontSize: 16.sp),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          //? ---- Product Quantity -----
                                          MyTextWidget(
                                            title:
                                                "x${cartDocument['quantity'].toString()}",
                                            style: style.subtitle1?.copyWith(
                                              color: AppColors.secondaryColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        }
      },
    );
  }
}
