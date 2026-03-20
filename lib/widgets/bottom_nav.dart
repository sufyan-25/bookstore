import 'package:flutter/material.dart';
import 'package:bookstore/config/config.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyling.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
        child: GNav(
          haptic: false, // haptic feedback
          tabBorderRadius: 50,
          iconSize: 24, // tab button icon size
          duration: Duration(milliseconds: 200), // tab animation duration
          gap: 8,
          color: AppStyling.textHint,
          backgroundColor: AppStyling.background,
          activeColor: AppStyling.textHint,
          tabBackgroundColor: Color(0xFF656565).withAlpha(100),
          padding: EdgeInsets.all(16),
          tabs: const [
            GButton(icon: Icons.home_outlined),
            GButton(icon: Icons.notifications_none_outlined),
            GButton(icon: Icons.search),
            GButton(icon: Icons.chat_bubble_outline_rounded),
            GButton(icon: Icons.settings),
          ],
        ),
      ),
    );
  }
}
