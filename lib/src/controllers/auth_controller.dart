import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/services/storage_services.dart';
import 'package:shopsy/src/utils/storage.dart';
import 'package:shopsy/src/widgets/snackbar_widget.dart';

import '../base/loading_widget.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _user;
  Rx<User?> get user => _user;
  final isVerifiedMail = false.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
  }

  //* -- Registration

  registration(String email, password) async {
    try {
      Get.showOverlay(
        loadingWidget: const Loading(),
        asyncFunction: () async {
          return await auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) => {
                    userRF.doc(value.user!.uid).set({
                      "uid": value.user!.uid,
                      "email": value.user!.email,
                      "firstName": null,
                      "lastName": null,
                      "phoneNumber": null,
                      "address": null,
                      "postalCode": null,
                      "profileImg": null,
                      "deliveryAddress": null,
                      "profileUpdated": false,
                      "emailVerfied": false,
                      "status": "pending",
                    }),
                  });
        },
      );
      await StorageServices.to.setBool(LOGIN_STATE, false);
      Get.offAllNamed("/complete");
    } catch (e) {
      snackBarWidget("Account Created Failed", e.toString());
    }
  }

  //* -- Complete Registration

  completeRegistration(String firstName, lastName, number, address) async {
    try {
      Get.showOverlay(
        loadingWidget: const Loading(),
        asyncFunction: () async {
          return await userRF.doc(auth.currentUser!.uid).update({
            "firstName": firstName,
            "lastName": lastName,
            "phoneNumber": number,
            "address": address,
            "profileUpdated": true,
          });
        },
      );
      await StorageServices.to.setBool(LOGIN_STATE, true);
      Get.offAllNamed("/success");
      snackBarWidget("About Profile", "Profile Created Successfully",
          success: true);
    } catch (e) {
      snackBarWidget("Profile Completion Failed", e.toString());
    }
  }

  //* -- Login

  login(String email, password) async {
    try {
      await Get.showOverlay(
        loadingWidget: const Loading(),
        asyncFunction: () async {
          return await auth.signInWithEmailAndPassword(
              email: email, password: password);
        },
      );

      await StorageServices.to.setBool(LOGIN_STATE, true);

      final docRef = userRF.doc(auth.currentUser!.uid);
      docRef.get().then((DocumentSnapshot doc) {
        var profileUpdated = doc['profileUpdated'];
        if (profileUpdated == true) {
          Get.offAllNamed("/navbar");
        } else {
          Get.offAllNamed("/complete");
        }
      });
      snackBarWidget("About User", "Login Successfully", success: true);
    } catch (e) {
      snackBarWidget("Login Failed", e.toString());
    }
  }

  //* -- Logout

  signOut() async {
    Get.showOverlay(
      loadingWidget: const Loading(),
      asyncFunction: () async {
        return await auth.signOut();
      },
    );
    snackBarWidget("About User", "Logout Successfully", success: true);
    await StorageServices.to.setBool(LOGIN_STATE, false);
    Get.offAllNamed("/login");
  }

  //* -- Forget Password

  forgetPassword(String email) async {
    try {
      List<String> signInMethods = await auth.fetchSignInMethodsForEmail(email);
      if (signInMethods.isEmpty) {
        snackBarWidget("About User", "User email doesn't exist",
            success: false);
      } else {
        Get.showOverlay(
          loadingWidget: const Loading(),
          asyncFunction: () async {
            return await auth.sendPasswordResetEmail(email: email);
          },
        );
        snackBarWidget("About Email", "Reset email sent successfully",
            success: true);
        Get.offAllNamed("/login");
      }
    } catch (error) {
      snackBarWidget("About User", error.toString(), success: false);
    }
  }

  //* -- Verify Email
  verifyEmail() async {
    try {
      User? user = auth.currentUser!;

      if (!(user.emailVerified)) {
        Get.showOverlay(
          loadingWidget: const Loading(),
          asyncFunction: () async {
            return await user.sendEmailVerification();
          },
        );
      }

      var mail = user.email;
      print(" User Email $mail");
      snackBarWidget(
          "Check your Inbox", "Verify email has been sent successfully",
          success: true);
      Future.delayed(const Duration(seconds: 30), () {
        auth.currentUser!.reload();
        if (user.emailVerified) {
          userRF.doc(auth.currentUser!.uid).update({
            "emailVerfied": true,
          });
          isVerifiedMail.value = true;
          print("Verifeidddddddddddd");
          update();
        }
      });
    } catch (e) {
      snackBarWidget("About Email", e.toString(), success: false);
    }
  }

  emailVerified() async {
    User? user = auth.currentUser!;
  }

  //* -- Change Password

  changePassword(String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;

    try {
      Get.showOverlay(
        loadingWidget: const Loading(),
        asyncFunction: () async {
          return await user?.updatePassword(newPassword);
        },
      );
      Fluttertoast.showToast(
          msg: "Password has been Changed", backgroundColor: Colors.green);
      Get.back();
    } catch (e) {
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
    }
  }
}
