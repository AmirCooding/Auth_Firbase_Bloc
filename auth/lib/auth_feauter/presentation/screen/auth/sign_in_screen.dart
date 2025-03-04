import 'package:auth/auth_feauter/domain/entity/auth_enity.dart';
import 'package:auth/auth_feauter/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:auth/core/widget/custom_button.dart';
import 'package:auth/core/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is SignInSuccess) {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/home');
          }

          if (state is AuthFailure) {
            Navigator.pop(context);
            passwordController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.message),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 40),
              CustomTextField(
                hintText: "Email...",
                labelText: "Email",
                controller: emailController,
                prefixIcon: const Icon(CupertinoIcons.mail),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Password...",
                labelText: "Password",
                controller: passwordController,
                prefixIcon: const Icon(CupertinoIcons.lock),
              ),
              const SizedBox(height: 40),
              CustomButton(
                  text: "Sign In",
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Email or password cannot be empty. "),
                        ),
                      );
                      return;
                    }
                    context.read<AuthBloc>().add(SignInWithEmailAndPassword(
                          AuthEntity(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        ));
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Noch kein Konto?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
