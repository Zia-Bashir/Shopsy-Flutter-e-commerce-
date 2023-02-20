import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/routes/app_routes.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/widgets/favourite_button_widget.dart';

class AllProductsBuilder extends StatelessWidget {
  const AllProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return SizedBox(
      child: StreamBuilder(
        stream: productsRF.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Loading(
                isContainer: false,
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.62,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
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
                                    height: 200.h,
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
                                  //? ---- Product Price -----
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
