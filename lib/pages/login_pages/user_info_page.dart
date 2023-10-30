import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  static const String id = "user_info_page";

  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final name = TextEditingController();
  final surname = TextEditingController();
  final username = TextEditingController();
  final bio = TextEditingController();
  String photoUrl = "";

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
              SizedBox(height: 100),

            ],
          ),
        ),
      ),
    );
  }
}
