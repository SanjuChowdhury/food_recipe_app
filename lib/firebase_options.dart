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
    apiKey: 'AIzaSyCbopJIb9ER7fCGcsZChAPl9p6HAyqMJFA',
    appId: '1:1085627930787:web:bd8cd820eb74ee2e66c716',
    messagingSenderId: '1085627930787',
    projectId: 'cookbook-42f8f',
    authDomain: 'cookbook-42f8f.firebaseapp.com',
    storageBucket: 'cookbook-42f8f.appspot.com',
    measurementId: 'G-XG1HMK03QS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_TV1QWmJM-vFYG3gGKJl5QvKWbCxpt5I',
    appId: '1:1085627930787:android:75bf5dbf3bc1ae5266c716',
    messagingSenderId: '1085627930787',
    projectId: 'cookbook-42f8f',
    storageBucket: 'cookbook-42f8f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyColDhtOygSF8vd8xY7m6pjjAdhaz1K0eY',
    appId: '1:1085627930787:ios:2d9b8c4949aa085166c716',
    messagingSenderId: '1085627930787',
    projectId: 'cookbook-42f8f',
    storageBucket: 'cookbook-42f8f.appspot.com',
    iosBundleId: 'com.example.foodRecipeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyColDhtOygSF8vd8xY7m6pjjAdhaz1K0eY',
    appId: '1:1085627930787:ios:2d9b8c4949aa085166c716',
    messagingSenderId: '1085627930787',
    projectId: 'cookbook-42f8f',
    storageBucket: 'cookbook-42f8f.appspot.com',
    iosBundleId: 'com.example.foodRecipeApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbopJIb9ER7fCGcsZChAPl9p6HAyqMJFA',
    appId: '1:1085627930787:web:d70cc85309f0ed6266c716',
    messagingSenderId: '1085627930787',
    projectId: 'cookbook-42f8f',
    authDomain: 'cookbook-42f8f.firebaseapp.com',
    storageBucket: 'cookbook-42f8f.appspot.com',
    measurementId: 'G-D0RGPD1F7W',
  );
}