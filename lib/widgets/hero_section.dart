import 'package:flutter/material.dart';
import 'package:bookstore/config/config.dart';


class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppStyling.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/splash_logo_transparent.png'),
          Text(
            'Hero Section',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.tagline,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
          ElevatedButton(
            onPressed: () {
              SplashScreen();
            },
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
