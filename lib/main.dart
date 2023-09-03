import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/screen/signup_screen.dart';
import 'package:instagram_clone_flutter/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBMp_c6XAWxc7k75JfUwihZF4xyii1Z1vM",
            appId: "1:365828607351:android:cdbbc760eeadcc9cf5e572e",
            messagingSenderId: "365828607351",
            projectId: "instagram-clone-22930",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const SignupScreen(),
    );
  }
}
