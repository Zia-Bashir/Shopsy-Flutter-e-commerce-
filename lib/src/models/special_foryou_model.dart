import 'package:flutter/cupertino.dart';
import 'package:shopsy/src/utils/app_images.dart';

class SpecialForYouModel {
  final String? title;
  final String? imgUrl;
  final String? brands;
  final CallbackAction? onTap;
  SpecialForYouModel({
    required this.title,
    required this.brands,
    required this.imgUrl,
    this.onTap,
  });
}

List<SpecialForYouModel> specialModel = [
  SpecialForYouModel(
      title: "SmartPhone", imgUrl: mobileSpecial, brands: "18 Brands"),
  SpecialForYouModel(title: "Ear Pods", brands: "16 Brands", imgUrl: earpodImg),
  SpecialForYouModel(title: "Laptops", brands: "5 Brands", imgUrl: laptopImg),
  SpecialForYouModel(
      title: "Smart Watches", brands: "11 Brands", imgUrl: smartWatchImg),
  SpecialForYouModel(
      title: "HeadPhones", brands: "8 Brands", imgUrl: headPhoneImg),
];
