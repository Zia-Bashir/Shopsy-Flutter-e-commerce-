import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

snackBarWidget(String title, String message, {bool? success = false}) {
  return Get.snackbar(
    title,
    message,
    icon: success == false
        ? Icon(
            Icons.close,
            color: Colors.red.shade100,
            size: 30.r,
          )
        : Icon(
            Icons.done,
            color: Colors.green.shade100,
            size: 30.r,
          ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor:
        success == false ? Colors.red.shade500 : Colors.green.shade500,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 3),
    isDismissible: true,
    dismissDirection: DismissDirection.startToEnd,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
