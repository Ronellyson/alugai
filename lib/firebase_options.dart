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
    apiKey: 'AIzaSyCqf7WWfqf-Ywr6XXdgDaMcs7ywNu3cURI',
    appId: '1:641596225873:web:db2bcfaed6a47231fefb70',
    messagingSenderId: '641596225873',
    projectId: 'alugai-d9e95',
    authDomain: 'alugai-d9e95.firebaseapp.com',
    storageBucket: 'alugai-d9e95.appspot.com',
    measurementId: 'G-EVQ98NNX6W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBm_2QWNPMTqkWs_80cxQRgtxyAlCfx9Nc',
    appId: '1:641596225873:android:8082f24eca3d08f4fefb70',
    messagingSenderId: '641596225873',
    projectId: 'alugai-d9e95',
    storageBucket: 'alugai-d9e95.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSXeHlyHLfNQHKIzZGo-jypbbSYVRGdTc',
    appId: '1:641596225873:ios:0a1c5fbb0355ed2dfefb70',
    messagingSenderId: '641596225873',
    projectId: 'alugai-d9e95',
    storageBucket: 'alugai-d9e95.appspot.com',
    iosClientId: '641596225873-o6g1i6vloa3r8pni8imk514r643n1jj2.apps.googleusercontent.com',
    iosBundleId: 'com.example.alugai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSXeHlyHLfNQHKIzZGo-jypbbSYVRGdTc',
    appId: '1:641596225873:ios:0a1c5fbb0355ed2dfefb70',
    messagingSenderId: '641596225873',
    projectId: 'alugai-d9e95',
    storageBucket: 'alugai-d9e95.appspot.com',
    iosClientId: '641596225873-o6g1i6vloa3r8pni8imk514r643n1jj2.apps.googleusercontent.com',
    iosBundleId: 'com.example.alugai',
  );
}