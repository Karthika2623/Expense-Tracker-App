import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {

  static FirebaseOptions get currentPlatform {

    switch (defaultTargetPlatform) {

      case TargetPlatform.android:
        return android;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );

    }

  }

  static const FirebaseOptions android = FirebaseOptions(

    apiKey: 'AIzaSyDwTy9TGhvJd09vPON9w-eck15uvOyUj5k',

    appId:
    '1:747260680945:android:09609fb3e5cefb496c6750',

    messagingSenderId: '747260680945',

    projectId: 'expensetrackerapp-cab0c',

    storageBucket:
    'expensetrackerapp-cab0c.firebasestorage.app',

  );

}