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
    apiKey: 'AIzaSyCijXQ6iN16qSZyFC9p4DsJkfsGvTWS1YA',
    appId: '1:855921746047:web:bb40b0fa141bcd27575f4a',
    messagingSenderId: '855921746047',
    projectId: 'data-48501',
    authDomain: 'data-48501.firebaseapp.com',
    storageBucket: 'data-48501.appspot.com',
    measurementId: 'G-F9EN66MJVN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMMflj_km8tH7LRHtODh5IdnwPN1Vx5Qw',
    appId: '1:855921746047:android:d5c29b1b14f37bef575f4a',
    messagingSenderId: '855921746047',
    projectId: 'data-48501',
    storageBucket: 'data-48501.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0RuyH0yb-aSOpZ75YSzLuYi1LSjUUE1A',
    appId: '1:855921746047:ios:c736e9b11d8bbf08575f4a',
    messagingSenderId: '855921746047',
    projectId: 'data-48501',
    storageBucket: 'data-48501.appspot.com',
    iosBundleId: 'com.example.internshalaAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0RuyH0yb-aSOpZ75YSzLuYi1LSjUUE1A',
    appId: '1:855921746047:ios:c736e9b11d8bbf08575f4a',
    messagingSenderId: '855921746047',
    projectId: 'data-48501',
    storageBucket: 'data-48501.appspot.com',
    iosBundleId: 'com.example.internshalaAssignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCijXQ6iN16qSZyFC9p4DsJkfsGvTWS1YA',
    appId: '1:855921746047:web:73b53e15a241290d575f4a',
    messagingSenderId: '855921746047',
    projectId: 'data-48501',
    authDomain: 'data-48501.firebaseapp.com',
    storageBucket: 'data-48501.appspot.com',
    measurementId: 'G-SQWH8DSTQ2',
  );
}
