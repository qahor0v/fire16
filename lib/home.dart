// ignore_for_file: use_build_context_synchronously

import 'package:fire16/pages/open_chat_page.dart';
import 'package:fire16/services/auth_services/firebase_auth_services.dart';
import 'package:fire16/services/real_db_services/real_db_services.dart';
import 'package:fire16/utils/app_loader.dart';
import 'package:fire16/utils/app_router.dart';
import 'package:fire16/widgets/app_main_button.dart';
import 'package:fire16/widgets/app_side_bar.dart';
import 'package:fire16/widgets/app_text_field.dart';
import 'package:fire16/widgets/chat_card_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String id = "home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FluChat"),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              AuthServices().logout();
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      drawer: const AppSideBar(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Go(context).go(const NewChatScreen());
        },
        child: const Icon(
          Icons.chat_bubble_outline,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return const HomeChatCard();
        },
      ),
    );
  }
}

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void sendMessage() async {
      showLoader(context);
      RealDatabaseServices realDatabaseServices = RealDatabaseServices();
      final user =
          await realDatabaseServices.searchUser(controller.text.trim());
      if (user != null) {
        Go(context).close();
        Go(context).close();
        Go(context).go(OpenChatPage(userModel: user));
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Yangi chat yaratish"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            AppTextField(
              hint: "Enter username",
              controller: controller,
            ),
            const SizedBox(height: 32),
            AppMainButton(
              title: "Yozish",
              onPressed: sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
