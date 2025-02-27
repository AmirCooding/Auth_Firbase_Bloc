import 'package:auth/auth_feauter/presentation/screen/auth/sign_in_screen.dart';
import 'package:auth/auth_feauter/presentation/screen/auth/sign_up_screen.dart';
import 'package:auth/auth_feauter/presentation/screen/profile/profile_screen.dart';
import 'package:auth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 90, 187, 34),
      ),
      useMaterial3: true,
    ),
    home: const SignUpScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/signin",
      routes: {
        "/signin": (context) => SignInScreen(),
        "/signup": (context) => SignUpScreen(),
        "/profile": (context) => ProfileScreen(),
        "/home": (context) => Home(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 3, 8, 60),
        ),
        useMaterial3: true,
      ),
      home: SignInScreen(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
