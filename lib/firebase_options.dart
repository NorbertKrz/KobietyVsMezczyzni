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
    apiKey: 'AIzaSyCKizmk9XJsUaw3cFsTC1aZ_BHSCAvqzDc',
    appId: '1:1063121709034:web:21f29ff4f5e17b2e4c7493',
    messagingSenderId: '1063121709034',
    projectId: 'genderwordchallenge',
    authDomain: 'genderwordchallenge.firebaseapp.com',
    storageBucket: 'genderwordchallenge.appspot.com',
    measurementId: 'G-4LP1CYZXFZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUWlLS_cz4KKUN5_yoboGFZ-Y5aWlgFPI',
    appId: '1:1063121709034:android:73cbff11f7d9ab2e4c7493',
    messagingSenderId: '1063121709034',
    projectId: 'genderwordchallenge',
    storageBucket: 'genderwordchallenge.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQIxnl-bAMhtcSWxCn74hwEDKFDxJMCqA',
    appId: '1:1063121709034:ios:892c89eb3044e4fd4c7493',
    messagingSenderId: '1063121709034',
    projectId: 'genderwordchallenge',
    storageBucket: 'genderwordchallenge.appspot.com',
    iosBundleId: 'com.genderFight',
  );
}