   import 'package:fire16/widgets/app_side_bar.dart';
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
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      drawer: const AppSideBar(),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return const HomeChatCard();
        },
      ),
    );
  }
}
