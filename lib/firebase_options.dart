import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for windows - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARDvED9ZezvmAjg9DWJ5xCysaItvqjY-4',
    appId: '1:1003343156210:android:5366c3a0f794102140d16b',
    messagingSenderId: '1003343156210',
    projectId: 'idental-412f6',
    storageBucket: 'com.example.idental_n_patient',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0eBwdYSVn-2GzRmSVnGSb8-Cw4Yjte4U',
    appId: '1:996387500617:ios:65a23e716f678d9fe5c598',
    messagingSenderId: '996387500617',
    projectId: 'fcmflutter33',
    storageBucket: 'fcmflutter33.appspot.com',
    iosClientId:
        '996387500617-lhv02mjd72pptsdmjrgr70doi6ibaksq.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcmflutter',
  );
}
