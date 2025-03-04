import 'package:auth/auth_feauter/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:auth/auth_feauter/presentation/screen/auth/sign_in_screen.dart';
import 'package:auth/auth_feauter/presentation/screen/auth/sign_up_screen.dart';
import 'package:auth/auth_feauter/presentation/screen/profile/profile_screen.dart';
import 'package:auth/core/widget/custom_button.dart';
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
        body: BlocConsumer<AuthBloc, AuthState>(
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
        if (state is SignOutSuccess) {
          Navigator.pushReplacementNamed(context, "/signin");
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home"),
              SizedBox(height: 20),
              CustomButton(
                  text: "Sign out",
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOut());
                  })
            ],
          ),
        );
      },
    ));
  }
}
