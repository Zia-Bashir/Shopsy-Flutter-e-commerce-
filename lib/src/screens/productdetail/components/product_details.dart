import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/screens/productdetail/components/expanded_text.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.pageId, required this.style});

  final int pageId;
  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data!.docs[pageId]['title'],
                    textAlign: TextAlign.left,
                    style: style.headline4?.copyWith(color: Colors.black)),
                // MyTextWidget(
                //     align: TextAlign.left,
                //     title: snapshot.data!.docs[pageId]['title'],
                //     style: style.headline4?.copyWith(color: Colors.black)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                      "\$${snapshot.data!.docs[pageId]['price'].toString()}",
                      textAlign: TextAlign.left,
                      style: style.bodyText2),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 16.h),
                //   child: MyTextWidget(
                //       title:
                //           "\$${snapshot.data!.docs[pageId]['price'].toString()}",
                //       style: style.bodyText2),
                // ),
                ExpandedText(
                    style: style,
                    description:
                        snapshot.data!.docs[pageId]['description'].toString()),
                // SizedBox(
                //   height: 60.h,
                //   child: Expanded(
                //     child: SingleChildScrollView(
                //       physics: const AlwaysScrollableScrollPhysics(),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           ExpandedText(
                //               style: style,
                //               description: snapshot
                //                   .data!.docs[pageId]['description']
                //                   .toString()),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyTextWidget(
                          title: tGetMoreDetails,
                          style: style.subtitle1
                              ?.copyWith(color: AppColors.mainColor)),
                      SizedBox(
                        width: 13.w,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.mainColor,
                        size: 12.sp,
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
