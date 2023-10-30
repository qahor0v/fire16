import 'package:fire16/constants/app_colors.dart';
import 'package:fire16/home.dart';
import 'package:fire16/pages/login_pages/sign_up.dart';
import 'package:fire16/services/auth_services/firebase_auth_services.dart';
import 'package:fire16/utils/app_loader.dart';
import 'package:fire16/utils/app_router.dart';
import 'package:fire16/utils/app_toast.dart';
import 'package:fire16/widgets/app_main_button.dart';
import 'package:fire16/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sign_in";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  void signIn() async {
    AuthServices authServices = AuthServices();
    final password = passwordController.text.trim();
    final email = emailController.text.trim();

    showLoader(context);
    authServices.signIn(email, password).then((value) {
      Go(context).close();
      if (value) {
        showToast(
          context: context,
          message: "Kirish muvaffaqiyatli amalga oshirildi!",
        );
        Go(context).id(HomePage.id);
      } else {
        showToast(
          context: context,
          message:
              "Xalotik! Email yoki parol noto'g'ri kiritilgan. Iltimos, tekshirib qaytadan urinib ko'ring",
        );
      }
    });
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
                  "Kirish",
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
              const SizedBox(height: 40),
              AppMainButton(
                title: "Kirish",
                onPressed: signIn,
              ),
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  text: "Akkauntingiz yo'qmi? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Ro'yxatdan o'tish",
                      style: const TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Go(context).id(SignUpPage.id);
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
