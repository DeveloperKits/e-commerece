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
    apiKey: 'AIzaSyBBKjykX0I-D472c2HO4tJt9BEdsqRPges',
    appId: '1:411745867774:web:a1afa07bbb91340ce852af',
    messagingSenderId: '411745867774',
    projectId: 'ekroy-d3039',
    authDomain: 'ekroy-d3039.firebaseapp.com',
    databaseURL: 'https://ekroy-d3039-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ekroy-d3039.appspot.com',
    measurementId: 'G-L52FYJP8R3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBY4y4KxLf36HhtJCXszx8XDcKkpaSn3z4',
    appId: '1:411745867774:android:70137f3d35c2f568e852af',
    messagingSenderId: '411745867774',
    projectId: 'ekroy-d3039',
    databaseURL: 'https://ekroy-d3039-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ekroy-d3039.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGWvJf2Wana3LbUKoHw-MmD3qQ26JbBao',
    appId: '1:411745867774:ios:106fb96ae082f762e852af',
    messagingSenderId: '411745867774',
    projectId: 'ekroy-d3039',
    databaseURL: 'https://ekroy-d3039-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ekroy-d3039.appspot.com',
    androidClientId: '411745867774-cnpcj0i1et25npm3rplk31hr3n4gapuv.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerece',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGWvJf2Wana3LbUKoHw-MmD3qQ26JbBao',
    appId: '1:411745867774:ios:c1209553e3e436a9e852af',
    messagingSenderId: '411745867774',
    projectId: 'ekroy-d3039',
    databaseURL: 'https://ekroy-d3039-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ekroy-d3039.appspot.com',
    androidClientId: '411745867774-cnpcj0i1et25npm3rplk31hr3n4gapuv.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerece.RunnerTests',
  );
}