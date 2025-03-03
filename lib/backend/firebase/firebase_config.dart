import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAmPltEx-Jv512sxV8lvEpO_w55eJ8IRQ4",
            authDomain: "todo-ea2e5.firebaseapp.com",
            projectId: "todo-ea2e5",
            storageBucket: "todo-ea2e5.firebasestorage.app",
            messagingSenderId: "6726305986",
            appId: "1:6726305986:web:999c0122d1a76bc322935b",
            measurementId: "G-XWN6334PRY"));
  } else {
    await Firebase.initializeApp();
  }
}
