import 'package:flutter/material.dart';
import './Login_page.dart' as login_page;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './Sign_Up_page.dart';
import './Home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // Use named routes to avoid circular imports and simplify navigation
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const login_page.LoginPage(),
      },
      home: StreamBuilder(
        stream: FirebaseAuth.instance
            .authStateChanges(), // this one stream every changes appeath to the fireabbse login state
        // know we build our ui based on the riceved data
        // if the data still loading we show a loading indicator
        // if the data returned showed that the user has logined before we go directly to the home pate
        // if not we go the sign up page / login page
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            return const HomePage();
          }
          return const SignUpPage();
        },
      ),
    );
  }
}
