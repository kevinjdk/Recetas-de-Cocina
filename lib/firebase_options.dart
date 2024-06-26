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
    apiKey: 'AIzaSyBwMOkpPvjinh24Q-Ki_QJWCO8AQI287fo',
    appId: '1:291104421548:web:86bb5a0d091354d51b9109',
    messagingSenderId: '291104421548',
    projectId: 'recetascocina-99278',
    authDomain: 'recetascocina-99278.firebaseapp.com',
    storageBucket: 'recetascocina-99278.appspot.com',
    measurementId: 'G-9NM9ETQEMF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDddwiSYi2UhBMzP7E41D6h7B1amijUBZ4',
    appId: '1:291104421548:android:7721bc1bc69091711b9109',
    messagingSenderId: '291104421548',
    projectId: 'recetascocina-99278',
    storageBucket: 'recetascocina-99278.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0O7nE26EPEufofzQClMEomNC6vWW1MqM',
    appId: '1:291104421548:ios:327657435d6617ca1b9109',
    messagingSenderId: '291104421548',
    projectId: 'recetascocina-99278',
    storageBucket: 'recetascocina-99278.appspot.com',
    iosBundleId: 'com.example.recetasCocina',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0O7nE26EPEufofzQClMEomNC6vWW1MqM',
    appId: '1:291104421548:ios:327657435d6617ca1b9109',
    messagingSenderId: '291104421548',
    projectId: 'recetascocina-99278',
    storageBucket: 'recetascocina-99278.appspot.com',
    iosBundleId: 'com.example.recetasCocina',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBwMOkpPvjinh24Q-Ki_QJWCO8AQI287fo',
    appId: '1:291104421548:web:f33433a827644ed71b9109',
    messagingSenderId: '291104421548',
    projectId: 'recetascocina-99278',
    authDomain: 'recetascocina-99278.firebaseapp.com',
    storageBucket: 'recetascocina-99278.appspot.com',
    measurementId: 'G-ZEWF75PW7L',
  );
}
