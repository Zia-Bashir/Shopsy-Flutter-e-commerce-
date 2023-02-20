import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/routes/app_routes.dart';
import 'package:shopsy/src/widgets/favourite_button_widget.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';

class PopularProductsBuilder extends StatelessWidget {
  const PopularProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return SizedBox(
      height: 210.h,
      width: screenWidth,
      child: StreamBuilder(
        stream: popularProductsRF.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                DocumentSnapshot parentDocument = snapshot.data!.docs[index];
                String productId = parentDocument['productId'];

                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Approutes.getDetailsScreen(index, productId));
                  },
                  child: StreamBuilder(
                    stream: parentDocument.reference
                        .collection("ProductImages")
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      } else {
                        return Container(
                          height: 210.h,
                          width: 140.w,
                          margin: EdgeInsets.only(right: 13.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 136.h,
                                    width: 140.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.seachBarColor,
                                      borderRadius: BorderRadius.circular(15.r),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data!.docs[0]['image']),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    parentDocument['title'].toString(),
                                    maxLines: 2,
                                    style: style.subtitle2?.copyWith(
                                        color: AppColors.secondaryColor,
                                        fontSize: 13.sp),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " \$${parentDocument['price'].toString()}",
                                    maxLines: 2,
                                    style: style.headline3?.copyWith(
                                        color: AppColors.mainColor,
                                        fontSize: 16.sp),
                                  ),
                                  FavouriteButtonWidget(
                                    proId: productId,
                                    productIndex: index,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    }, //end
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
