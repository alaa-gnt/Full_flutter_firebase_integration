import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './Login_page.dart' as login_page;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );

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
              "Sign Up.",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            // email Text Field
            Container(
              width: 370,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),

            SizedBox(height: 20),

            // password Text Field
            Container(
              width: 370,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            SizedBox(height: 20),

            // Sign Up Button
            Container(
              width: 370,
              height: 65,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  await createUserWithEmailAndPassword();
                },
                child: Text(
                  "Sign Up",
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
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                InkWell(
                  onTap: () {
                    // Navigate to the Login page defined in ./Login_page.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => login_page.LoginPage(),
                      ),
                    );
                  },

                  child: Text(
                    'Sign in',
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
