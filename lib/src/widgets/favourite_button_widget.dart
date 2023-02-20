import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopsy/src/controllers/popular_product_controller.dart';
import 'package:shopsy/src/firebase/firebase_references.dart';
import 'package:shopsy/src/utils/app_toast.dart';
import 'package:shopsy/src/widgets/success_toast.dart';

class FavouriteButtonWidget extends StatelessWidget {
  const FavouriteButtonWidget({
    Key? key,
    this.proId,
    this.size = 25,
    this.productIndex,
  }) : super(key: key);
  final String? proId;
  final int? productIndex;
  final double? size;

  @override
  Widget build(BuildContext context) {
    PopularProductController controller = PopularProductController();
    return StreamBuilder(
      stream: favouriteProductRF
          .doc(authCurrentUser)
          .collection("products")
          .where("productId", isEqualTo: proId)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Text('');
        } else {
          return Center(
              child: GestureDetector(
            onTap: () {
              if (snapshot.data.docs.length == 0) {
                controller.addedToFavourite(
                  proId!,
                  productIndex!,
                );
                showToast(
                    context,
                    const SuccessToast(
                      msg: "Add to Favourite",
                    ));
              } else {
                controller.reomoveFromFavourite(proId!);
                showToast(
                    context,
                    const SuccessToast(
                      msg: "Removed from Favourite",
                      size: 210,
                    ));
              }
            },
            child: Icon(
              Icons.favorite_rounded,
              color: snapshot.data.docs.length == 0 ? Colors.grey : Colors.red,
              size: size!.r,
            ),
          ));
        }
      },
    );
  }
}
