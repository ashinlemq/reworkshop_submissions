import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  final FirebaseAuth _auth;

  Auth({super.key, FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Travel Expenses"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            width: 320,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: repeatPasswordController,
                  decoration: const InputDecoration(hintText: "Repeat Password"),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () async {
                    // Block login if passwords do not match
                    if (passwordController.text != repeatPasswordController.text) {
                      setState(() {
                        errorMessage = "Passwords do not match.";
                      });
                      return;
                    }

                    try {
                      setState(() => errorMessage = null); // Clear old errors
                      await widget._auth.signInWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      if (context.mounted && Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    } on FirebaseAuthException catch (e) {
                      setState(() => errorMessage = e.message);
                    }
                  },
                  child: const Text("Login"),
                ),
                TextButton(
                  onPressed: () async {
                    if (passwordController.text != repeatPasswordController.text) {
                      setState(() {
                        errorMessage = "Passwords do not match.";
                      });
                      return;
                    }

                    try {
                      setState(() => errorMessage = null);
                      await widget._auth.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      if (context.mounted && Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    } on FirebaseAuthException catch (e) {
                      setState(() => errorMessage = e.message);
                    }
                  },
                  child: const Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}