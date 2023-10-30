import 'package:fire16/widgets/app_text_field.dart';
import 'package:fire16/widgets/message_screen.dart';
import 'package:flutter/material.dart';

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

