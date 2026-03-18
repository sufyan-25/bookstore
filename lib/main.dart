import 'package:bookstore/views/home_screen.dart';
import 'package:bookstore/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      // home: const AnimatedSplashScreenWidget(),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/splash': (context) => AnimatedSplashScreenWidget(),
        '/splash2': (context) => SplashScreen(),
      },
    );
  }
}
