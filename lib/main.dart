import 'package:fire16/home.dart';
import 'package:fire16/pages/login_pages/sign_in.dart';
import 'package:fire16/pages/login_pages/sign_up.dart';
import 'package:fire16/pages/login_pages/user_info_page.dart';
import 'package:fire16/services/auth_services/firebase_auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CheckUser(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        SignInPage.id: (context) => const SignInPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        UserInfoPage.id: (context) => const UserInfoPage(),
      },
    );
  }
}

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthServices().getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Icon(
              Icons.error_outline_outlined,
              color: Colors.red,
            ),
          );
        } else {
          if (snapshot.data == null) {
            return const SignUpPage();
          } else {
            return const UserInfoPage();
          }
        }
      },
    );
  }
}
