import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAbtR5ZJyV6tBbjSWDfaDgzacWelx_Wk-U",
            authDomain: "yourcaio-c75b4.firebaseapp.com",
            projectId: "yourcaio-c75b4",
            storageBucket: "yourcaio-c75b4.appspot.com",
            messagingSenderId: "506919437259",
            appId: "1:506919437259:web:f1c518ab9a365f12256c4e",
            measurementId: "G-3VPGP51M6K"));
  } else {
    await Firebase.initializeApp();
  }
}
