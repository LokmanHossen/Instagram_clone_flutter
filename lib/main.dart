import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/providers/user_provider.dart';
// import 'package:instagram_clone_flutter/responsive/mobile_screen_layout.dart';
// import 'package:instagram_clone_flutter/responsive/responsive_layout_screen.dart';
// import 'package:instagram_clone_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_clone_flutter/screens/login_screen.dart';
import 'package:instagram_clone_flutter/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyBpayM5EppLJofqtSV2xCDtA9NHuxC9BjY',
            appId: '1:202012320145:android:75531e3a25b1f7b9743a30',
            messagingSenderId: '202012320145',
            projectId: 'instagram-clone-914f6',
            storageBucket: 'instagram-clone-914f6.appspot.com',
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.active) {
            //   if (snapshot.hasData) {
            //     return const ResponsiveLayout(
            //       webScreenLayout: WebScreenLayout(),
            //       mobileScreenLayout: MobileScreenLayout(),
            //     );
            //   } else if (snapshot.hasError) {
            //     return Center(
            //       child: Text('${snapshot.error}'),
            //     );
            //   }
            // }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
