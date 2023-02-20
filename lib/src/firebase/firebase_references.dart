import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

final authCurrentUser = auth.currentUser!.uid;
final authCurrentUserMail = auth.currentUser!.email;
final authCurrentUserVerifiedMail = auth.currentUser!.emailVerified;
final userRF = firestore.collection("UserData");
final popularProductsRF = firestore.collection("PopularProducts");
final productsRF = firestore.collection("Products");
final favouriteProductRF = firestore.collection("FavouriteProducts");
final cartProductRF = firestore.collection("CartProducts");
final cartProductCollectionRF =
    cartProductRF.doc(authCurrentUser).collection("products");
