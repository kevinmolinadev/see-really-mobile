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
    apiKey: 'AIzaSyBUwDnBSEbUdSkgLOZrMwwO5p-F2b7n4uc',
    appId: '1:1043050284842:web:a51c16562acf729cfb4053',
    messagingSenderId: '1043050284842',
    projectId: 'see-really',
    authDomain: 'see-really.firebaseapp.com',
    storageBucket: 'see-really.appspot.com',
    measurementId: 'G-93HVEW922X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnwzXBLrwThYYate4YZ1Qx2bMrncaNj2E',
    appId: '1:1043050284842:android:ef98dfa29cfa2cf0fb4053',
    messagingSenderId: '1043050284842',
    projectId: 'see-really',
    storageBucket: 'see-really.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwOcqmHHvxnBxH4iXpM3yW9LcB20XIdaA',
    appId: '1:1043050284842:ios:577ea9f6e0ecdde0fb4053',
    messagingSenderId: '1043050284842',
    projectId: 'see-really',
    storageBucket: 'see-really.appspot.com',
    iosBundleId: 'com.example.seeReally',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwOcqmHHvxnBxH4iXpM3yW9LcB20XIdaA',
    appId: '1:1043050284842:ios:1131481895e036a1fb4053',
    messagingSenderId: '1043050284842',
    projectId: 'see-really',
    storageBucket: 'see-really.appspot.com',
    iosBundleId: 'com.example.seeReally.RunnerTests',
  );
}