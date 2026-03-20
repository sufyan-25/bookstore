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
      drawer: DrawerWidget(),

      // body: SafeArea(
      //   //Body Styling
      //   // child: Container(
      //   //   padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
      //   //   decoration: BoxDecoration(
      //   //     gradient: LinearGradient(
      //   //       begin: Alignment.topLeft,
      //   //       end: Alignment.bottomRight,
      //   //       colors: [Color(0xFFFF8B5A), Color(0xFFFF5a5a)], //
      //   //     ),
      //   //   ),
      //   child: Column(
      //     children: [
      //       // No AppBar, so we create a custom header with a hamburger menu
      //       Container(
      //         height: 60,
      //         decoration: BoxDecoration(
      //           color: Color(0xFF292929),
      //         ),
      //         child: Row(
      //           children: [
      //             Builder(
      //               builder: (context) => IconButton(
      //                 icon: Icon(Icons.verified_user_rounded, color: Colors.white),
      //                 onPressed: () => Scaffold.of(context).openDrawer(),
      //               ),
      //             ),
      //             Text(
      //               "My Custom Header",
      //               style: TextStyle(color: Colors.white),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(height: 8),
      //       // Rest of your app content
      //       Expanded(
      //         child: ListView(
      //           children: [
      //             const HeroSection(),
      //             const SizedBox(height: 16),
      //             const HeroSection(),
      //             const SizedBox(height: 16),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // ),
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
              children: [const HeroSection(), const SizedBox(height: 16)],
            ),
          );
        },
      ),
    );
  }
}
