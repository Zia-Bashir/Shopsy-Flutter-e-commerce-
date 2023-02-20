import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/popular_product_controller.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class ProductImageContainer extends StatelessWidget {
  ProductImageContainer({
    Key? key,
    required this.id,
    required this.proId,
  }) : super(key: key);
  final int id;
  final String? proId;
  final controller = PopularProductController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          popularProductsRF.doc(proId).collection("ProductImages").snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //* --- Image ---
              Obx(
                (() => Container(
                      height: 160.h,
                      width: 210.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data!
                              .docs[controller.selectedImage.value]['image']),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 48.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index > 5) {
                      return const Text('data');
                    } else {
                      return Obx(
                        //* --- Select Image ---
                        (() => GestureDetector(
                              onTap: () {
                                controller.displayImage(index);
                              },
                              child: Container(
                                height: 48.h,
                                width: 48.w,
                                margin: EdgeInsets.only(right: 10.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: controller.selectedImage.value ==
                                              index
                                          ? AppColors.mainColor
                                          : Colors.transparent),
                                  image: DecorationImage(
                                      scale: 15,
                                      image: NetworkImage(
                                          snapshot.data!.docs[index]['image']),
                                      fit: BoxFit.scaleDown),
                                ),
                              ),
                            )),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          );
        }
      },
    );
  }
}
