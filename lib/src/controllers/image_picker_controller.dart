import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shopsy/src/base/loading_widget.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/widgets/mytext_widget.dart';

class ImagePickerController extends GetxController {
  ImagePicker picker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  File? image;

  pickerBottomSheet(context) {
    var style = Theme.of(context).textTheme;
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200.h,
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    pickCameraImage();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    width: double.infinity,
                    height: 80.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.productBGColor),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.camera,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        MyTextWidget(
                            title: "Upload From Camera",
                            style:
                                style.headline3?.copyWith(color: Colors.black))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pickGalleryImage();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    width: double.infinity,
                    height: 80.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.productBGColor),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.image,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        MyTextWidget(
                            title: "Upload From Gallery",
                            style:
                                style.headline3?.copyWith(color: Colors.black))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  pickCameraImage() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
      File? imagePath = File(pickedFile!.path);
      image = imagePath;
      Get.showOverlay(
        loadingWidget: const Loading(),
        asyncFunction: () async {
          return await uploadIamgeIntoCollection(image!);
        },
      );
      update();
    } else {
      Fluttertoast.showToast(msg: "Camera Permission is required");
    }
  }

  pickGalleryImage() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      File? imagePath = File(pickedFile!.path);
      image = imagePath;
      Get.showOverlay(
        loadingWidget: const Loading(),
        asyncFunction: () async {
          return await uploadIamgeIntoCollection(image!);
        },
      );

      update();
    } else {
      Fluttertoast.showToast(msg: "Gallery Permission is required");
    }
  }

  uploadIamgeIntoCollection(File image) async {
    try {
      Reference reference = storage
          .ref('userProfileImages')
          .child(authCurrentUserMail!)
          .child("profileImage/");

      UploadTask uploadTask = reference.putFile(image);
      await Future.value(uploadTask).onError((error, stackTrace) {
        return uploadTask;
      });
      var url = await reference.getDownloadURL();
      //* -- add Picture into UserData Collection
      userRF.doc(authCurrentUser).update({
        'profileImg': url,
      });
      Fluttertoast.showToast(
          msg: "Image Uploaded", backgroundColor: Colors.green);
      update();
    } catch (e) {
      Fluttertoast.showToast(msg: "Image uploading Failed");
    }
  }
}
