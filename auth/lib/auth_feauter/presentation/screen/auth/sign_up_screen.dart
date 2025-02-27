import 'package:auth/core/widget/custom_button.dart';
import 'package:auth/core/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController reppassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
              hintText: "Enter Email...",
              labelText: "Email",
              controller: emailController,
              prefixIcon: Icon(CupertinoIcons.mail)),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
              hintText: "Enter Password...",
              labelText: "Password",
              controller: passController,
              prefixIcon: Icon(CupertinoIcons.lock)),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
              hintText: "Confirm Password...",
              labelText: "Confirm Password",
              controller: reppassController,
              prefixIcon: Icon(CupertinoIcons.lock)),
          SizedBox(
            height: 40,
          ),
          CustomButton(text: "Sign up", onPressed: () {}),
        ],
      ),
    );
  }
}
