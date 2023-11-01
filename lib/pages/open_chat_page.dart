import 'package:fire16/models/chat_model.dart';
import 'package:fire16/models/message_model.dart';
import 'package:fire16/models/user_model.dart';
import 'package:fire16/utils/app_id_generator.dart';
import 'package:fire16/widgets/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OpenChatPage extends StatefulWidget {
  final UserModel userModel;
  final ChatModel? chatModel;

  const OpenChatPage({
    super.key,
    required this.userModel,
    this.chatModel,
  });

  @override
  State<OpenChatPage> createState() => _OpenChatPageState();
}

class _OpenChatPageState extends State<OpenChatPage> {
  String myID = '1';
  List<Message> allMessages = [];
  final messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      Message message = Message(
        id: Token.id(),
        senderID: myID,
        text: messageController.text.trim(),
        file: '',
        image: '',
        readed: false,
        sendTime: Token.now(),
      );
      setState(() {
        allMessages.add(message);
        messageController.clear();
      });
    }
  }

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
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.userModel.photoUrl,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.userModel.name} ${widget.userModel.surname}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.userModel.online
                      ? "Online"
                      : DateFormat("hh:mm").format(
                          DateTime.parse(widget.userModel.lastEnteredToApp),
                        ),
                  style: const TextStyle(
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allMessages.length,
              itemBuilder: (context, index) {
                return MessageScreen(
                  message: allMessages[index],
                  myID: myID,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            decoration: const BoxDecoration(color: Colors.white),
            height: 60,
            child: Center(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter message",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: sendMessage,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
