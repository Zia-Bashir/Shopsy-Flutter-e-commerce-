import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopsy/src/controllers/address_controller.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/app_sizes.dart';
import 'package:shopsy/src/utils/app_text.dart';
import 'package:shopsy/src/widgets/my_elevated_button_widget.dart';
import 'package:shopsy/src/widgets/textfiled_widget.dart';

class AddressForm extends GetView<AddressController> {
  const AddressForm({super.key});
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: defaultPaddingHight,
          ),
          //* -- Input fileds
          Column(
            children: [
              TextFieldWidget(
                controller: controller.nameController,
                hintText: tFullName,
                lable: tFullName,
                icon: Icons.person,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your name is required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: controller.numberController,
                keyboard: TextInputType.phone,
                hintText: tNumber,
                lable: tNumber,
                icon: Icons.numbers,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your number is required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: controller.stateController,
                lable: tState,
                icon: Icons.pin_drop,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your State is required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: controller.countryController,
                lable: tCountry,
                icon: Icons.pin_drop,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your country name is required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                controller: controller.addressController,
                lable: tAddress,
                maxLine: 2,
                icon: Icons.pin_drop,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Your address is required";
                  }
                  return null;
                },
              ),

              //* --- Google Map
              GetBuilder<AddressController>(builder: (mapController) {
                return GestureDetector(
                  onTap: () {
                    mapController.getCurrentLocation();
                    print("------------OnTap");
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.h),
                    margin: EdgeInsets.only(
                      top: 20.h,
                    ),
                    height: 200.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.productBGColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 160.h,
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Stack(
                              children: [
                                GoogleMap(
                                    initialCameraPosition: const CameraPosition(
                                        target: LatLng(31.5204, 74.3587),
                                        zoom: 10),
                                    zoomGesturesEnabled: false,
                                    zoomControlsEnabled: false,
                                    mapType: MapType.normal,
                                    markers: mapController.markers,
                                    onMapCreated: (controller) {
                                      print("Map Created");
                                      mapController.googleMapContoller =
                                          controller;
                                    }),
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  color: Colors.black45,
                                  child: Center(
                                      child: Icon(
                                    Icons.my_location_rounded,
                                    color: Colors.white,
                                    size: 50.r,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(
                              () => LocationRichTextWidget(
                                style: style,
                                text: "Latitude : ",
                                value: mapController.userLat.value == 0.0
                                    ? "_"
                                    : mapController.userLat.value.toString(),
                              ),
                            ),
                            Obx(
                              () => LocationRichTextWidget(
                                style: style,
                                text: "Longitude : ",
                                value: mapController.userLong.value == 0.0
                                    ? "_"
                                    : mapController.userLong.value.toString(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              })
            ],
          ),

          //* --- Elevated Button

          SizedBox(
            height: elevatedBetweenSize,
          ),
          MyElevatedButtonWidget(
              ontap: () {
                if (controller.formKey.currentState!.validate()) {
                  if (controller.userLat.value != 0.0) {
                    controller.saveDeliveryAddress();
                    print("okay------------------");
                  } else {
                    Get.defaultDialog(
                        title: "Location is required",
                        titleStyle:
                            style.subtitle2?.copyWith(color: Colors.red),
                        middleText: "Tap on google map to give location access",
                        textConfirm: "Okay",
                        confirmTextColor: Colors.white,
                        onConfirm: () => Get.back(),
                        buttonColor: AppColors.mainColor);
                  }
                }
              },
              text: "Save"),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }
}

class LocationRichTextWidget extends StatelessWidget {
  const LocationRichTextWidget({
    Key? key,
    required this.style,
    required this.text,
    required this.value,
  }) : super(key: key);

  final TextTheme style;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: text, style: style.subtitle2, children: [
        TextSpan(
          text: value,
          style: style.subtitle2?.copyWith(fontSize: 10.sp),
        )
      ]),
    );
  }
}
