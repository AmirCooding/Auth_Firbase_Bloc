import 'package:auth/auth_feauter/presentation/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SignInScreen(),
  ));
}
