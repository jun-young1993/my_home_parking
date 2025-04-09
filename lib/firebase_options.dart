// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA7IlxT9TUEvjQf4YTXfCLiR2Pbu4MJEA4',
    appId: '1:375371943797:web:abe3a7cb378c8be9a00d3c',
    messagingSenderId: '375371943797',
    projectId: 'my-home-parking-10ea8',
    authDomain: 'my-home-parking-10ea8.firebaseapp.com',
    storageBucket: 'my-home-parking-10ea8.firebasestorage.app',
    measurementId: 'G-S1T1C9R9F4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9Qyyk2G0CY7ZHXBmK0x02CRgW7CThX5U',
    appId: '1:375371943797:android:c716451e773865b2a00d3c',
    messagingSenderId: '375371943797',
    projectId: 'my-home-parking-10ea8',
    storageBucket: 'my-home-parking-10ea8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCqytTz91s1Y2zx4JrCoNhRu8rKIxuFv0',
    appId: '1:375371943797:ios:6a25303e92999334a00d3c',
    messagingSenderId: '375371943797',
    projectId: 'my-home-parking-10ea8',
    storageBucket: 'my-home-parking-10ea8.firebasestorage.app',
    iosBundleId: 'com.example.myHomeParking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCqytTz91s1Y2zx4JrCoNhRu8rKIxuFv0',
    appId: '1:375371943797:ios:6a25303e92999334a00d3c',
    messagingSenderId: '375371943797',
    projectId: 'my-home-parking-10ea8',
    storageBucket: 'my-home-parking-10ea8.firebasestorage.app',
    iosBundleId: 'com.example.myHomeParking',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA7IlxT9TUEvjQf4YTXfCLiR2Pbu4MJEA4',
    appId: '1:375371943797:web:928d23b01e5bcb84a00d3c',
    messagingSenderId: '375371943797',
    projectId: 'my-home-parking-10ea8',
    authDomain: 'my-home-parking-10ea8.firebaseapp.com',
    storageBucket: 'my-home-parking-10ea8.firebasestorage.app',
    measurementId: 'G-855ZSFF7N8',
  );
}
