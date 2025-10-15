import 'package:flutter/material.dart';
import 'Pages/Login_page.dart' as login_page;
import 'package:firebase_core/firebase_core.dart';
import 'Fireabse/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/Sign_Up_page.dart';
import 'Pages/Home_page.dart';
import 'Pages/Selection_page.dart';

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
        scaffoldBackgroundColor:
            Colors.grey[200], // Set app-wide background color
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.grey[200], // Match app bar color to background
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // Use named routes to avoid circular imports and simplify navigation
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/login': (context) => const login_page.LoginPage(),
        '/home': (context) => HomePage(),
        '/SelectionPage': (context) => const SelectionPage(),
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
            return HomePage();
          }
          return SignUpPage();
        },
      ),
    );
  }
}
