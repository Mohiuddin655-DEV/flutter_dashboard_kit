import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class ApiInfo {
  static const String mapKEY = "AIzaSyAH3YlAGGvrX4OXz_xyPSqkzdpvDy3lEiU";

  static const firebaseConfig = kIsWeb
      ? FirebaseOptions(
          apiKey: "AIzaSyBJq24FKcnavBWcHui-Iapk8RYjqWxhbRU",
          authDomain: "bmry-p.firebaseapp.com",
          databaseURL: "https://bmry-p-default-rtdb.firebaseio.com",
          projectId: "bmry-p",
          storageBucket: "bmry-p.appspot.com",
          messagingSenderId: "1093914170192",
          appId: "1:1093914170192:web:9cb125c59614961f5b1255",
          measurementId: "G-EB29CR7BPK",
        )
      : null;
}
