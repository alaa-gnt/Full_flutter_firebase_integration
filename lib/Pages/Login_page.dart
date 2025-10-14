import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailEntryController = TextEditingController();
  final TextEditingController _passwordEntryController =
      TextEditingController();

  @override
  void dispose() {
    _emailEntryController.dispose();
    _passwordEntryController.dispose();
    super.dispose();
  }

  // function that retrive the login infos

  Future<void> signInWithEmailAndPassword() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailEntryController.text.trim(),
            password: _passwordEntryController.text.trim(),
          );
      // Use the credential for debugging / further logic
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300),
            Text(
              "Login.",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            // email Text Field
            SizedBox(
              width: 370,
              child: TextField(
                controller: _emailEntryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),

            SizedBox(height: 20),

            // password Text Field
            SizedBox(
              width: 370,
              child: TextField(
                controller: _passwordEntryController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            SizedBox(height: 20),

            // Sign Up Button
            SizedBox(
              width: 370,
              height: 65,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  await signInWithEmailAndPassword();
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Sign In Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'wanna Create a new account? ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                InkWell(
                  onTap: () {
                    // Navigate back to the Sign Up page using a named route
                    Navigator.pushNamed(context, '/signup');
                  },

                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 119, 8, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
