import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/controllers/popular_product_controller.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/routes/app_routes.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_images.dart';
import 'package:shopsy/src/utils/app_toast.dart';
import 'package:shopsy/src/widgets/success_toast.dart';

class FavouriteProducts extends StatelessWidget {
  const FavouriteProducts({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    PopularProductController controller = PopularProductController();
    //* ---- Stream Favourite Products -----
    return StreamBuilder(
      stream: favouriteProductRF
          .doc(authCurrentUser)
          .collection("products")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Loading(isContainer: false),
          );
        } else {
          if (snapshot.data!.docs.length == 0) {
            return SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(emptyLottie),
                ],
              ),
            );
          } else {
            //* ---- Grid Builder -----
            return GridView.builder(
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.57,
              ),
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DocumentSnapshot favDocument = snapshot.data!.docs[index];
                int productIndex = favDocument['productIndex'];
                String productId = favDocument['productId'];

                //* ---- Stream Popular Products -----
                return StreamBuilder(
                  stream: popularProductsRF.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      //? ---- Parent Document SnapShot -----
                      DocumentSnapshot parentDocument =
                          snapshot.data!.docs[productIndex];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //* ---- Navigate to Products Details -----
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Approutes.getDetailsScreen(
                                    productIndex, productId));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          height: 200.h,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            color: AppColors.productBGColor,
                                            borderRadius:
                                                BorderRadius.circular(15),

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
                                    height: 10.h,
                                  ),

                                  //? ---- Product Title -----
                                  Text(
                                      snapshot.data!.docs[productIndex]['title']
                                          .toString(),
                                      maxLines: 2,
                                      style: style.subtitle2),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //? ---- Product Price -----
                                Text(
                                  "\$${snapshot.data!.docs[productIndex]['price'].toString()}",
                                  maxLines: 2,
                                  style: style.headline3?.copyWith(
                                      color: AppColors.mainColor,
                                      fontSize: 16.sp),
                                ),

                                //? ---- Remove from Favourite -----
                                GestureDetector(
                                  onTap: () {
                                    controller.reomoveFromFavourite(productId);
                                    showToast(
                                        context,
                                        const SuccessToast(
                                          msg: "Removed from Favourite",
                                          size: 210,
                                        ));
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red.shade100),
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.red,
                                        size: 16.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
