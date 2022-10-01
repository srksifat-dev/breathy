import 'package:breathy/feature/auth/sign_in/screen/sign_in_screen.dart';
import 'package:breathy/feature/auth/sign_up/screen/sign_up_screen.dart';
import 'package:breathy/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breathy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: SignInScreen(),
    );
  }
}
