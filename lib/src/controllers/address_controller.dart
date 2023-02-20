import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/Material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';

class AddressController extends GetxController {
  late GoogleMapController googleMapContoller;
  Set<Marker> markers = {};
  final userLat = 0.0.obs;
  final userLong = 0.0.obs;
  final address = ''.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    nameController.dispose();
    numberController.dispose();
    addressController.dispose();
    stateController.dispose();
    countryController.dispose();
    super.onClose();
  }

  getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    userLat.value = double.parse(locationData.latitude.toString());
    userLong.value = double.parse(locationData.longitude.toString());
    //  marker add
    addMarker(LatLng(userLat.value, userLong.value));
    googleMapContoller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            userLat.value,
            userLong.value,
          ),
          zoom: 17,
        ),
      ),
    );
    update();
  }

  addMarker(LatLng position) {
    markers.add(
      Marker(
          markerId: const MarkerId('user'),
          position: position,
          infoWindow: const InfoWindow(title: "Your Location")),
    );
    update();
  }

  saveDeliveryAddress() {
    try {
      String deliveryAddress = "${nameController.text.toString()},"
          "${numberController.text.trim().toString()},\n"
          "${addressController.text.trim().toString()},\n"
          "${stateController.text.trim().toString()},"
          "${countryController.text.trim().toString()},\n"
          "${userLat.value.toString()}, "
          "${userLong.value.toString()}";
      userRF.doc(authCurrentUser).update({"deliveryAddress": deliveryAddress});
      Fluttertoast.showToast(msg: "Address added Successfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error", backgroundColor: Colors.red);
    }
  }

  deliverAddress() async {
    final docRef = userRF.doc(auth.currentUser!.uid);
    docRef.get().then((DocumentSnapshot doc) {
      address.value = doc['deliveryAddress'];
      update();
    });
    update();
  }
}
