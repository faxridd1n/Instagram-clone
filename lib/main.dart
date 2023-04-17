import 'package:flutter/material.dart';
import 'package:instagram_clone/View/Pages/Auth/signInPage.dart';
import 'package:instagram_clone/View/Pages/Auth/signUpPage.dart';
import 'package:instagram_clone/View/Pages/MainPage.dart';

import 'View/Pages/Auth/splashPage.dart';

void main() {
  runApp(const MyApp());
}
//B
//nb=
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      routes: {
        '/SignInPage':(context) => const SignInPage(),
        '/SignUpPage':(context) => const SignUpPage(),
        '/MainView':(context) => const MainPage(),
      },
    );
  }
}
