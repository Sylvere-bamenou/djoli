import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC80fZ0-yrXGe_A04iGD-b_RXEWpthWrXI",
            authDomain: "freeflixbj.firebaseapp.com",
            projectId: "freeflixbj",
            storageBucket: "freeflixbj.appspot.com",
            messagingSenderId: "1045078397689",
            appId: "1:1045078397689:web:d467c0973c8c47da780828",
            measurementId: "G-30MNTM3B62"));
  } else {
    await Firebase.initializeApp();
  }
}
