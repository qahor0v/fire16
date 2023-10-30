import 'package:fire16/constants/app_colors.dart';
import 'package:fire16/pages/login_pages/sign_in.dart';
import 'package:fire16/pages/login_pages/user_info_page.dart';
import 'package:fire16/services/auth_services/firebase_auth_services.dart';
import 'package:fire16/utils/app_loader.dart';
import 'package:fire16/utils/app_router.dart';
import 'package:fire16/utils/app_toast.dart';
import 'package:fire16/widgets/app_main_button.dart';
import 'package:fire16/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();
  final emailController = TextEditingController();

  void signUp() async {
    AuthServices authServices = AuthServices();
    final password = passwordController.text.trim();
    final cPassword = cPasswordController.text.trim();
    final email = emailController.text.trim();
    if (password == cPassword) {
      showLoader(context);
      authServices.signUp(email, password).then((value) {
        Go(context).close();
        if (value) {
          showToast(context: context, message: "Ro'yxatdan o'tdingiz!");
          Go(context).id(UserInfoPage.id);
        } else {
          showToast(
            context: context,
            message:
                "Siz allaqachon ro'yxatdan o'tgansiz. Iltimos, boshqa email bilan ro'yxatdan o'ting!",
          );
        }
      });
    } else {
      showToast(context: context, message: "Parolni to'g'ri kiriting!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              const Center(
                child: Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              AppTextField(
                hint: "Email",
                controller: emailController,
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: "Password",
                controller: passwordController,
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: "Confirm password",
                controller: cPasswordController,
              ),
              const SizedBox(height: 40),
              AppMainButton(
                title: "Ro'yxatdan o'tish",
                onPressed: signUp,
              ),
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  text: "Akkauntingiz bormi? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Kirish",
                      style: const TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Go(context).id(SignInPage.id);
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
