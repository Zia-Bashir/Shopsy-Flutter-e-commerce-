// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/home_controller.dart';
import 'package:shopsy/src/screens/home/components/all_products_builder.dart';
import 'package:shopsy/src/screens/home/components/my_appbar.dart';
import 'package:shopsy/src/screens/home/components/popular_products_builder.dart';
import 'package:shopsy/src/screens/home/components/promo_banner.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/utils/my_icons_icons.dart';
import 'package:shopsy/src/widgets/see_more_text_widget.dart';

import 'components/category_container.dart';
import 'components/special_item_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    Get.lazyPut(() => HomeController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
          ),
          child: Column(
            children: [
              //* -- App Bar
              MyAppBar(style: style),

              //* -- Promotional Banner
              const PromoBanner(),

              //* -- Categories
              //? -- OnTap
              Padding(
                padding: EdgeInsets.only(right: 24.w, bottom: 20.h, left: 24.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryContainer(
                        ontap: () {},
                        icon: MyIcons.flash_icon,
                        title: "Flash\nDeal",
                      ),
                      CategoryContainer(
                        ontap: () {},
                        icon: MyIcons.bill_icon,
                        title: "Bill",
                      ),
                      CategoryContainer(
                        ontap: () {},
                        icon: MyIcons.game_icon,
                        title: "Game",
                      ),
                      CategoryContainer(
                        ontap: () {},
                        icon: MyIcons.gift_icon,
                        title: "Daily\nGift",
                      ),
                      CategoryContainer(
                        ontap: () {},
                        icon: MyIcons.discover,
                        title: "More",
                      ),
                    ]),
              ),

              //* -- Scroll
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.h, left: 24.w),
                    child: Column(
                      children: [
                        //* -- Special For You
                        SeeMoreTextWidget(
                          style: style,
                          text: tSpecial4u,
                          ontap: () {},
                        ),
                        //* ---- Special Item Builder
                        SizedBox(
                          height: 100.h,
                          width: screenWidth,
                          child: SpecialItemsBuilder(style: style),
                        ),

                        //* -- Popular Products

                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: SeeMoreTextWidget(
                            style: style,
                            text: tPopularProducts,
                            ontap: () {},
                          ),
                        ),

                        //* -- Popular Products Stream Builder
                        const PopularProductsBuilder(),
                        SizedBox(
                          height: 20.h,
                        ),
                        //* -- All Products Stream Builder
                        const AllProductsBuilder(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
