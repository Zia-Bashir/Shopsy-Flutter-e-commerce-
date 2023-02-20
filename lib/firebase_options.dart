// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCT9buBO987-al66IGG9HhSKij7zEMbUZg',
    appId: '1:313378041655:web:521c7f2942ad9e68b2f4b2',
    messagingSenderId: '313378041655',
    projectId: 'shopsy-f9b35',
    authDomain: 'shopsy-f9b35.firebaseapp.com',
    storageBucket: 'shopsy-f9b35.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxbyMc2_eZAT370TwsOwL4PGwl_sM5lCU',
    appId: '1:313378041655:android:8633e70c70874b69b2f4b2',
    messagingSenderId: '313378041655',
    projectId: 'shopsy-f9b35',
    storageBucket: 'shopsy-f9b35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSe9-szHN1aou-ezjF3725GJlrE7Q-Yss',
    appId: '1:313378041655:ios:ce2c51788203bd57b2f4b2',
    messagingSenderId: '313378041655',
    projectId: 'shopsy-f9b35',
    storageBucket: 'shopsy-f9b35.appspot.com',
    iosClientId: '313378041655-9p2hlln5kq7vcp7bh3ou2kot3h1pibdk.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopsy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSe9-szHN1aou-ezjF3725GJlrE7Q-Yss',
    appId: '1:313378041655:ios:ce2c51788203bd57b2f4b2',
    messagingSenderId: '313378041655',
    projectId: 'shopsy-f9b35',
    storageBucket: 'shopsy-f9b35.appspot.com',
    iosClientId: '313378041655-9p2hlln5kq7vcp7bh3ou2kot3h1pibdk.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopsy',
  );
}