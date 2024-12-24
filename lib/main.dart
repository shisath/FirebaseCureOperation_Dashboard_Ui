import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase CRUD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class DefaultFirebaseOptions {
  static const FirebaseOptions currentPlatform = FirebaseOptions(
      apiKey: "AIzaSyBdJFKxg7-WSrb0eKJNHYCvbYmfJu97wQg",
      authDomain: "firecrudapp-b1f3a.firebaseapp.com",
      projectId: "firecrudapp-b1f3a",
      storageBucket: "firecrudapp-b1f3a.firebasestorage.app",
      messagingSenderId: "130484030618",
      appId: "1:130484030618:web:4afab6dcfacd13db37e323");
}
