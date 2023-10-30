
import 'package:fire16/constants/app_colors.dart';
import 'package:fire16/pages/open_chat_page.dart';
import 'package:fire16/utils/app_router.dart';
import 'package:flutter/material.dart';

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

