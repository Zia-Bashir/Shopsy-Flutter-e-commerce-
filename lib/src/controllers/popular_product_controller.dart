import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../firebase/firebase_references.dart';

class PopularProductController extends GetxController {
  RxString ratingValue = '0'.obs;
  RxInt selectedImage = 0.obs;
  RxInt selectedColor = 0.obs;
  RxBool isFavourite = false.obs;
  RxString productSelectedColor = "".obs;
  RxInt quantity = 1.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    resetValue();
    super.onInit();
  }

  //= ---- Display Image Selection -----
  displayImage(int index) {
    selectedImage.value = index;
    update();
  }

  //= ---- Color Selection -----
  selectColor(int index) {
    selectedColor.value = index;
    update();
  }

  //= ---- Get Color -----
  String get getColor {
    return productSelectedColor.value;
  }

//= ---- Get Product Rating -----
  getProductRating(String? proId) async {
    await popularProductsRF.doc(proId).get().then((DocumentSnapshot doc) {
      ratingValue.value = doc['rating'].toString();
      update();
    });
  }

  //= ---- Add to Favourite -----
  addedToFavourite(
    String productId,
    int productIndex,
  ) {
    return favouriteProductRF
        .doc(authCurrentUser)
        .collection("products")
        .doc(productId)
        .set({
      "uid": authCurrentUser,
      "productId": productId,
      "productIndex": productIndex,
      "isFavourite": true
    });
  }

//= ---- Remove from Favourite -----
  reomoveFromFavourite(String productId) {
    return favouriteProductRF
        .doc(authCurrentUser)
        .collection("products")
        .doc(productId)
        .delete();
  }

//= ---- Add to Cart -----
  addedToCart(
      {required String productId,
      required int productIndex,
      required String productColor,
      required int quantity,
      required double productPrice}) {
    return cartProductRF
        .doc(authCurrentUser)
        .collection("products")
        .doc(productId)
        .set({
      "uid": authCurrentUser,
      "productId": productId,
      "productIndex": productIndex,
      "productColor": productColor,
      "quantity": quantity,
      "price": productPrice,
      "isCart": true
    });
  }

  //= ---- Set Quantity -----
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (quantity >= 10) {
        quantity.value = 10;
      } else {
        quantity = quantity + 1;
      }
    } else {
      if (quantity <= 1) {
        quantity.value = 1;
      } else {
        quantity = quantity - 1;
      }
    }

    update();
  }

  //= ---- Get Quantity -----
  int get getQuantity {
    return quantity.value;
  }

  //= ---- Reset Values -----
  resetValue() {
    quantity.value = 1;
    selectedImage.value = 0;
    selectedColor.value = 0;
    update();
  }
}
