import 'package:flutter/material.dart';
import 'package:bookstore/config/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            icon: const Icon(Icons.account_circle_outlined),
            color: Colors.white, // Change the color of the profile icon here
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
        title: Text(AppStrings.appName, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF292929),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNav(),
      drawer: DrawerWidget(),
      body: Builder(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFF8B5A), Color(0xFFFF5a5a)], //
              ),
            ),
            child: ListView(
              children: [
                const HeroSection(),
                const SizedBox(height: 16),
                const HeroSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}
