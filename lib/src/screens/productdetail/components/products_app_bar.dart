import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        width: screenWidth,
        color: Colors.transparent,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                    size: 18.sp,
                  )),
            ),
          ),
          Container(
            height: 28.h,
            width: 64.w,
            padding: EdgeInsets.only(right: 5.w, left: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: popularProductsRF.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    DocumentSnapshot parentDocument = snapshot.data!.docs[id];
                    if (!snapshot.hasData) {
                      return MyTextWidget(title: "0.0", style: style.subtitle1);
                    } else {
                      return MyTextWidget(
                          title: parentDocument['rating'].toString(),
                          style: style.subtitle1);
                    }
                  },
                ),
                const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
