import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/cart_controller.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/utils/my_icons_icons.dart';
import 'package:shopsy/src/widgets/appbar_button_widget.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/utils/app_colors.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextTheme style;
  final cartControlle = CartController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 46.h,
              width: 215.w,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              decoration: BoxDecoration(
                  color: AppColors.seachBarColor,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 20.r,
                    color: AppColors.secondaryColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MyTextWidget(
                    title: tSeachProduct,
                    style: style.subtitle1,
                  ),
                ],
              )),
          Row(
            children: [
              AppBarButtonWidget(
                ontap: () {
                  Get.toNamed("/cart");

                  //* --- Stream the Latest price of Carted Product
                  cartControlle.updateCartProductPrice();
                },
                icon: MyIcons.cart_icon,
                child: StreamBuilder(
                  stream: cartProductRF
                      .doc(authCurrentUser)
                      .collection("products")
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else {
                      return MyTextWidget(
                        title: snapshot.data!.docs.length.toString(),
                        style: style.subtitle1
                            ?.copyWith(color: Colors.white, fontSize: 10.sp),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              AppBarButtonWidget(
                ontap: () {},
                icon: MyIcons.bell,
                child: MyTextWidget(
                  title: "3",
                  style: style.subtitle1
                      ?.copyWith(color: Colors.white, fontSize: 10.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
