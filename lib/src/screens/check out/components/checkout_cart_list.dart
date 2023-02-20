import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class CheckOutCartList extends StatelessWidget {
  const CheckOutCartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: 100.h,
        width: double.maxFinite,

        //* --- Stream Cart Products ---
        child: StreamBuilder(
          stream: cartProductRF
              .doc(authCurrentUser)
              .collection("products")
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Loading(isContainer: false),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  //* --- Cart Documnet SnapShot---
                  DocumentSnapshot cartDocument = snapshot.data!.docs[index];
                  String productId = cartDocument['productId'];

                  //* --- Stream Popular Product Image ---
                  return StreamBuilder(
                    stream: popularProductsRF
                        .doc(productId)
                        .collection("ProductImages")
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      } else {
                        return Container(
                          height: 100.h,
                          width: 88.w,
                          margin: EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: AppColors.productBGColor,
                            image: DecorationImage(
                              image:
                                  NetworkImage(snapshot.data!.docs[0]['image']),
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
