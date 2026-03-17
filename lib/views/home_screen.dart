import 'package:flutter/material.dart';
import 'package:bookstore/config/config.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key}); // Variables for colors
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color of the hamburger icon here
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: AppStyling.textHint,
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
        title: Text(
          AppStrings.appName,
          style: TextStyle(color: AppStyling.textHint),
        ),
        backgroundColor: AppStyling.background,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNav(),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text("L O G O", style: TextStyle(fontSize: 35)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('H O M E', style: TextStyle(fontSize: 15)),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('A B O U T', style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF8B5A), Color(0xFFFF5a5a)], //
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const HeroSection(),
            const SizedBox(height: 16),
            const HeroSection(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
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
        ],
      ),
    );
  }
}

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
