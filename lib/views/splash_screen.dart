import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bookstore/views/home_screen.dart';
import 'package:flutter/material.dart';

class AnimatedSplashScreenWidget extends StatelessWidget {
  const AnimatedSplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Icons.home,
      nextScreen: MainScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blue,
    );
  }
}
