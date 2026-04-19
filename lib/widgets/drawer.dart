import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF5a5a), Color(0xFFFF8B5A)], //
          ),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/splash_logo_transparent.png',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 8),
                  Text("B O O K S T O R E", style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home', style: TextStyle(fontSize: 15)),
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Login', style: TextStyle(fontSize: 15)),
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Signup', style: TextStyle(fontSize: 15)),
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.question_answer),
                    title: Text('Book Detail', style: TextStyle(fontSize: 15)),
                    onTap: () {
                      Navigator.pushNamed(context, '/book-detail');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
