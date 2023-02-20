// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';

class DataUploaderController extends GetxController {
  RxInt proID = 0.obs;
  @override
  void onReady() {
    super.onReady();
    dataUploader();
  }

  Future<void> dataUploader() async {
    try {
      final firestore = FirebaseFirestore.instance;
      // final manifestContent = await DefaultAssetBundle.of(Get.context!)
      //     .loadString("AssetManifest.json");
      // final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);
      // final productsInAssets = manifestMap.keys
      //     .where((path) =>
      //         path.startsWith("assets/database/products") &&
      //         path.contains(".json"))
      //     .toList();
      // print(" ------------ $productsInAssets");

      var dataList = [];
      String stringProducts =
          await rootBundle.loadString("assets/database/products.json");
      dataList.add(jsonDecode(stringProducts));

      // print(dataList);

      var productsList = dataList[0]['products'];

      //print(productsList);
      //* ----- Product List Uploader

      for (var products in productsList) {
        popularProductsRF.doc(products['productId']).set({
          "productId": products['productId'],
          "title": products['title'],
          "description": products['description'],
          "rating": products['rating'],
          "price": products['price'],
          "brandName": products['brandName'],
          "categoryName": products['categoryName'],
          "isPopular": false,
          "isBestSeller": false,
          "discount": 0,
          "inStock": 10,
        });

        //* ---- Document Reference

        DocumentReference imageRf({
          required String productId,
        }) =>
            popularProductsRF.doc(productId).collection("ProductImages").doc();
        DocumentReference colorRf({
          required String productId,
        }) =>
            popularProductsRF.doc(productId).collection("ProductColors").doc();

        //* ----- Images List Uploader

        var imagesList = productsList[proID.value]['productImages'];

        for (var images in imagesList) {
          final productPath = imageRf(productId: products['productId']);
          await productPath.set({"image": images['image']});
        }

        // //* ----- Color List Uploader

        var colorList = productsList[proID.value]['ProductColors'];

        for (var colors in colorList) {
          final colorPath = colorRf(productId: products['productId']);
          await colorPath.set({
            "color": colors['color'],
          });
        }
        var abc = proID.value++;
        print("-----------$abc");

        update();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
