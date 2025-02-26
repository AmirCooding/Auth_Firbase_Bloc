import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign_up');
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
