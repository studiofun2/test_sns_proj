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
    apiKey: 'AIzaSyDAiBtkEBDIggulgLhNWPHQNl3nv-mnz4E',
    appId: '1:952497900568:web:ff56c101e8b595d6b9c76d',
    messagingSenderId: '952497900568',
    projectId: 'test-sns-proj-412a8',
    authDomain: 'test-sns-proj-412a8.firebaseapp.com',
    databaseURL: 'https://test-sns-proj-412a8-default-rtdb.firebaseio.com',
    storageBucket: 'test-sns-proj-412a8.appspot.com',
    measurementId: 'G-N26GFTLL5M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADWjakcJlX3_6i5pFoqgzFeQMfpEy3vQA',
    appId: '1:952497900568:android:fcef03075c650892b9c76d',
    messagingSenderId: '952497900568',
    projectId: 'test-sns-proj-412a8',
    databaseURL: 'https://test-sns-proj-412a8-default-rtdb.firebaseio.com',
    storageBucket: 'test-sns-proj-412a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCg8AkdwgvcUWproa97bpaJVe2XZENFf4s',
    appId: '1:952497900568:ios:3b38192fa589cefeb9c76d',
    messagingSenderId: '952497900568',
    projectId: 'test-sns-proj-412a8',
    databaseURL: 'https://test-sns-proj-412a8-default-rtdb.firebaseio.com',
    storageBucket: 'test-sns-proj-412a8.appspot.com',
    iosClientId: '952497900568-lnelbnbo06eltdf6887hcut2kd54pq50.apps.googleusercontent.com',
    iosBundleId: 'com.example.testSnsProj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCg8AkdwgvcUWproa97bpaJVe2XZENFf4s',
    appId: '1:952497900568:ios:3b38192fa589cefeb9c76d',
    messagingSenderId: '952497900568',
    projectId: 'test-sns-proj-412a8',
    databaseURL: 'https://test-sns-proj-412a8-default-rtdb.firebaseio.com',
    storageBucket: 'test-sns-proj-412a8.appspot.com',
    iosClientId: '952497900568-lnelbnbo06eltdf6887hcut2kd54pq50.apps.googleusercontent.com',
    iosBundleId: 'com.example.testSnsProj',
  );
}
