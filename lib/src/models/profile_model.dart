import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/controllers/auth_controller.dart';
import 'package:shopsy/src/screens/home/home_screen.dart';
import 'package:shopsy/src/utils/app_images.dart';

class ProfileModel {
  final String title;
  final String icon;
  final VoidCallback ontap;

  ProfileModel({required this.title, required this.icon, required this.ontap});
}

List<ProfileModel> profileModel = [
  ProfileModel(
      title: "My Account",
      icon: personIcon,
      ontap: () {
        Get.to(() => const HomeScreen());
      }),
  ProfileModel(title: "Notifications", icon: pathIcon, ontap: () {}),
  ProfileModel(title: "Settings", icon: settingIcon, ontap: () {}),
  ProfileModel(title: "Help Center", icon: questionMarkIcon, ontap: () {}),
  ProfileModel(
      title: "Log Out",
      icon: logOutIcon,
      ontap: () {
        AuthController.instance.signOut();
      }),
];
