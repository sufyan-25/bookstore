import 'package:bookstore/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      home: HomeScreen(),
      // home: const SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/book-detail': (context) => BookDetailScreen(
          book: {
            "title": "Castle The Sky",
            "price": 16.0,
            "images": [
              "https://picsum.photos/400?1",
              "https://picsum.photos/400?2",
              "https://picsum.photos/400?3",
            ],
            "description":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. This is a professional demo description for your bookstore app.",
          },
        ),
      },
    );
  }
}
