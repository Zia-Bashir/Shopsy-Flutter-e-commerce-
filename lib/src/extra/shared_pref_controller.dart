// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController extends GetxController {
  bool islogIn = false;
  setOnboarding() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("onboarding", true);
  }

  getOnboarding() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.get("onboarding");
  }

  setLogIn({required islogIn}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("login", islogIn);
  }

  getLogIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.get("login");
  }
}
