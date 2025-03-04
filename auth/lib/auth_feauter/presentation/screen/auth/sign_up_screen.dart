import 'dart:math';

import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:auth/core/widget/custom_button.dart';
import 'package:auth/core/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is IsEmailAlreadyRegistrated) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text("Email is already registered"),
              ),
            );
            emailController.clear();
            passController.clear();
            reppassController.clear();
          }

          if (state is IsEmailAlreadyNotRegistrated) {
            context.read<AuthBloc>().add(SignUpWithEmailAndPassword(
                  AuthEntity(
                    email: emailController.text,
                    password: passController.text,
                  ),
                ));
          }
          if (state is SignUpSuccess) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/signin');
          }
          if (state is SignOutSuccess) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/signin');
          }
          if (state is AuthFailure) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              ),
            );
          }
        },
        child: Column(
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
              prefixIcon: Icon(CupertinoIcons.mail),
            ),
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
            CustomButton(
              text: "Sign up",
              onPressed: () {
                final email = emailController.text;
                final password = passController.text;
                final confirmPassword = reppassController.text;
                if (password != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Passwords do not match"),
                    ),
                  );
                  return;
                }
                context
                    .read<AuthBloc>()
                    .add(IsEmailAlreadyRegisteredEvent(email: email));
              },
            ),
          ],
        ),
      ),
    );
  }
}
