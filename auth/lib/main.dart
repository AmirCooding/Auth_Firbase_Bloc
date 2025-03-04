import 'package:auth/auth_feauter/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:auth/auth_feauter/presentation/screen/auth/sign_in_screen.dart';
import 'package:auth/auth_feauter/presentation/screen/auth/sign_up_screen.dart';
import 'package:auth/auth_feauter/presentation/screen/profile/profile_screen.dart';
import 'package:auth/firebase_options.dart';
import 'package:auth/locator/setup_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(locator()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/signin",
        routes: {
          "/signin": (context) => SignInScreen(),
          "/signup": (context) => SignUpScreen(),
          "/profile": (context) => ProfileScreen(),
          "/home": (context) => Home(),
        },
        title: 'Flutter Auth App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 3, 8, 60),
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}

// ✅ Home-Screen korrekt implementieren
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Welcome to Home Screen")),
    );
  }
}
