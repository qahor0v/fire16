import 'package:fire16/constants/app_colors.dart';
import 'package:fire16/utils/app_router.dart';
import 'package:fire16/widgets/app_side_bar.dart';
import 'package:fire16/widgets/app_text_field.dart';
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

class HomeChatCard extends StatelessWidget {
  const HomeChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        onTap: () {
          Go(context).go(const OpenChatPage());
        },
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            border: Border.all(color: mainColor),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/firelesson16.appspot.com/o/movies%2F1000000029.jpg?alt=media&token=8e457cd3-5d42-4e44-a909-5dcc658492f0",
              ),
            ),
          ),
        ),
        title: const Text(
          "Ruhiddin Nuriddinov",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          maxLines: 1,
        ),
        subtitle: const Text(
          "Chinavtu Zamon? Koro sarami?",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black54,
            fontSize: 14,
          ),
          maxLines: 1,
        ),
        trailing: const Column(
          children: [
            Text("12:09"),
          ],
        ),
      ),
    );
  }
}

class OpenChatPage extends StatefulWidget {
  const OpenChatPage({super.key});

  @override
  State<OpenChatPage> createState() => _OpenChatPageState();
}

class _OpenChatPageState extends State<OpenChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(color: Colors.white70),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/firelesson16.appspot.com/o/movies%2F1000000029.jpg?alt=media&token=8e457cd3-5d42-4e44-a909-5dcc658492f0",
                    ),
                    fit: BoxFit.cover,
                  )),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nuriddinov Ruhiddin",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Online",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 60,
        child: AppTextField(
          hint: 'Message text',
          controller: TextEditingController(),
        ),
      ),
      body: ListView.builder(
        itemCount: 23,
        itemBuilder: (context, index) {
          return MessageScreen(
            byMe: index % 2 == 0,
          );
        },
      ),
    );
  }
}

class MessageScreen extends StatelessWidget {
  final bool byMe;

  const MessageScreen({
    super.key,
    required this.byMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: byMe ? 80 : 16,
        right: !byMe ? 80 : 16,
        top: 4,
        bottom: 4,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: byMe ? Colors.green.shade100 : Colors.blue.shade100,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: byMe ? const Radius.circular(16) : Radius.zero,
            bottomRight: !byMe ? const Radius.circular(16) : Radius.zero,
          )),
      child: Column(
        children: [
          const Text(
            "dofjdojfd fkdfjdofjodf dfodjfodjfodf dofjdofjdofj dfojdfojdf dfodjfodjfodjf fdodjfodjfodjf ndfodjofjdnfdfojdofjdojfd 0odfjdofdofjo",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "18:03",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              if (byMe)
                const Icon(
                  Icons.done_all,
                  size: 16,
                  color: Colors.blue,
                )
            ],
          ),
        ],
      ),
    );
  }
}
