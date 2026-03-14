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
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    this.bodyBackgroundColor = const Color(0xFF292929),
    this.bodyTextColor = Colors.white,
    this.section1BackgroundColor = const Color(0xFF3B3B3B),
    this.section1TextColor = Colors.white,
    this.section2BackgroundColor = const Color(0xFF1E1E1E),
    this.section2TextColor = const Color(0xFFE0E0E0),
    this.appBarBackgroundColor = Colors.green, // app bar background color
    this.appBarTextColor = Colors.white, // app bar text color
  }); // Variables for colors

  final Color bodyBackgroundColor;
  final Color bodyTextColor;
  final Color section1BackgroundColor;
  final Color section1TextColor;
  final Color section2BackgroundColor;
  final Color section2TextColor;
  final Color appBarBackgroundColor;
  final Color appBarTextColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      appBar: AppBar(
        title: Text('Book Store', style: TextStyle(color: appBarTextColor)),
        backgroundColor: appBarBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: section1BackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Section One',
                    style: TextStyle(
                      color: section1TextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This is the first section with customizable text and background colors.',
                    style: TextStyle(color: section1TextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: section2BackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Section Two',
                    style: TextStyle(
                      color: section2TextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This is the second section. Change the section colors from the MainScreen properties.',
                    style: TextStyle(color: section2TextColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome to the Book Store!',
              textAlign: TextAlign.center,
              style: TextStyle(color: bodyTextColor, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
