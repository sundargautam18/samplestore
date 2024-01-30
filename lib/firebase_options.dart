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
    apiKey: 'AIzaSyB2-RIoZe7CaOkOM3mxp6ZU35eyeGtCcHE',
    appId: '1:793311572069:web:cb34a95195e7dae839968c',
    messagingSenderId: '793311572069',
    projectId: 'hamropasal-d2e35',
    authDomain: 'hamropasal-d2e35.firebaseapp.com',
    storageBucket: 'hamropasal-d2e35.appspot.com',
    measurementId: 'G-T97JVLQSMQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfXC47_2zwcjiKV9IjaQa5hqKXXHi3EQQ',
    appId: '1:793311572069:android:4928e9ea74d4560339968c',
    messagingSenderId: '793311572069',
    projectId: 'hamropasal-d2e35',
    storageBucket: 'hamropasal-d2e35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlGSGcLwOo5q--Aoc2YD8lvI70Rf2jQaQ',
    appId: '1:793311572069:ios:777a7a44568f74c539968c',
    messagingSenderId: '793311572069',
    projectId: 'hamropasal-d2e35',
    storageBucket: 'hamropasal-d2e35.appspot.com',
    androidClientId: '793311572069-bo8eru70khdrbhe3031pjecvl6g9q4rt.apps.googleusercontent.com',
    iosClientId: '793311572069-akrheoksk624jf3pmcua4e675o1tqfcc.apps.googleusercontent.com',
    iosBundleId: 'com.example.samplestore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlGSGcLwOo5q--Aoc2YD8lvI70Rf2jQaQ',
    appId: '1:793311572069:ios:fc2f7613798b53ea39968c',
    messagingSenderId: '793311572069',
    projectId: 'hamropasal-d2e35',
    storageBucket: 'hamropasal-d2e35.appspot.com',
    androidClientId: '793311572069-bo8eru70khdrbhe3031pjecvl6g9q4rt.apps.googleusercontent.com',
    iosClientId: '793311572069-r2tt7ijskb3r8ikkkh3b3t99kdn7cojf.apps.googleusercontent.com',
    iosBundleId: 'com.example.samplestore.RunnerTests',
  );
}