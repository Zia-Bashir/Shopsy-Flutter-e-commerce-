import 'package:get/get.dart';
import 'package:shopsy/src/screens/address/address_screen.dart';
import 'package:shopsy/src/screens/cart/cart_screen.dart';
import 'package:shopsy/src/screens/check%20out/check_out_screen.dart';
import 'package:shopsy/src/screens/completeProfile/complete_profile_screen.dart';
import 'package:shopsy/src/screens/changePassword/change_password.dart';
import 'package:shopsy/src/screens/forget%20password/forget_password_screen.dart';
import 'package:shopsy/src/screens/home/home_screen.dart';
import 'package:shopsy/src/screens/login/login_screen.dart';
import 'package:shopsy/src/screens/loginsuccess/login_success_screen.dart';
import 'package:shopsy/src/screens/navbar/bottom_nav_bar.dart';
import 'package:shopsy/src/screens/onboarding/onboarding_screen.dart';
import 'package:shopsy/src/screens/otp/otp_verfication_screen.dart';
import 'package:shopsy/src/screens/productdetail/product_details_screen.dart';
import 'package:shopsy/src/screens/signup/sign_up_screen.dart';
import 'package:shopsy/src/screens/splash/splash_screen.dart';

class Approutes {
  static const String detailScreen = '/details';
  static String getDetailsScreen(int pageId, String productId) =>
      '$detailScreen?pageId=$pageId&productId=$productId';

  static List<GetPage> routes = [
    //= -- Initial Route
    GetPage(
      name: "/",
      page: () => const SplashScreen(),
    ),

    //= -- OnBoarding Screen Route
    GetPage(
      name: "/onboarding",
      page: () => const OnBoardingScreen(),
    ),

    //= -- LogIn Screen Route
    GetPage(
      name: "/login",
      page: () => const LoginScreen(),
    ),
    //= -- SignUp Screen Route
    GetPage(
      name: "/signup",
      page: () => const SignUpScreen(),
    ),

    //= -- SignUp Complete Screen Route
    GetPage(
      name: "/complete",
      page: () => const CompleteProfileScreen(),
    ),

    //= -- Forget Password Screen Route
    GetPage(
      name: "/forget",
      page: () => const ForgetPasswordScreen(),
    ),

    //= -- Forget Confirm Screen Route
    GetPage(
      name: "/changePassword",
      page: () => const ChangePassword(),
    ),

    //= -- Home Screen Route
    GetPage(
      name: "/home",
      page: () => const HomeScreen(),
    ),

    //= -- Login Success Screen Route
    GetPage(
      name: "/success",
      page: () => const LoginSuccessScreen(),
    ),

    //= -- NavBar Screen Route
    GetPage(
      name: "/navbar",
      page: () => const BottomNavBarScreen(),
    ),

    //= -- OTP Verification Screen Route
    GetPage(
      name: "/otp",
      page: () => const OtpVerificationScreen(),
    ),

    //= -- Product Detail Screen Route
    GetPage(
        name: detailScreen,
        page: () {
          var pageId = Get.parameters['pageId'];
          String? productId = Get.parameters['productId'];
          return ProductDetailsScreen(
            pageId: int.parse(pageId!),
            productId: productId,
          );
        },
        transition: Transition.fadeIn),

    //= -- Cart Screen Route
    GetPage(
      name: "/cart",
      page: () => const CartScreen(),
    ),
    //= -- Address Screen Route
    GetPage(
      name: "/address",
      page: () => const AddressScreen(),
    ),
    //= -- Checkout Screen Route
    GetPage(
      name: "/checkout",
      page: () => const CheckOutScreen(),
    ),
  ];
}
