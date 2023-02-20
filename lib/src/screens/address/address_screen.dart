import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/screens/address/components/address_form.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //* --- Edit Address Text with Back Button
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.black,
                      size: 30.r,
                    ),
                  ),
                  MyTextWidget(
                      title: tYourAddress,
                      style: style.headline5?.copyWith(color: Colors.black)),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.transparent,
                      size: 30.r,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            //* --- Address Form
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const AddressForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
