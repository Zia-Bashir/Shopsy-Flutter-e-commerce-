import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_text.dart';

import '../../widgets/mytext_widget.dart';
import 'components/favourite_products.dart';

class FavouriteProductsScreen extends StatelessWidget {
  const FavouriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //* --- Favourite Text
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyTextWidget(title: tFavourite, style: style.headline5),
                ],
              ),
            ),

            SizedBox(
              height: 40.h,
            ),

            //* ---- Grid Builder
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: FavouriteProducts(style: style),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
