// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/screens/login/login_screen.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController(viewportFraction: 1);
  RxInt curentPageValue = 0.obs;

  jumpNextPage() {
    pageController.nextPage(
        duration: const Duration(microseconds: 5000), curve: Curves.easeIn);
    //curentPageValue.value = pageController.page!.toInt();
    update();
  }

  naviagateToLogin() {
    if (curentPageValue == 2) {
      //Get.offAllNamed("/login");
      Get.offAll(() => const LoginScreen());
    }
  }
}
