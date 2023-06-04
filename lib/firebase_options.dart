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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDI5_DOV81BYsGOBR8WGGWR0mPxKdTSriA',
    appId: '1:630961080332:web:e59beb83ac4a0e33e60629',
    messagingSenderId: '630961080332',
    projectId: 'login-b391c',
    authDomain: 'login-b391c.firebaseapp.com',
    storageBucket: 'login-b391c.appspot.com',
    measurementId: 'G-YKG25RPDKY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqe6Z-lyrJlYb6fisvp6h6uub2RD7Ti9E',
    appId: '1:630961080332:android:5d268e15ed022f5be60629',
    messagingSenderId: '630961080332',
    projectId: 'login-b391c',
    storageBucket: 'login-b391c.appspot.com',
  );
}