import 'dart:developer';

import 'package:fire16/models/message_model.dart';
import 'package:fire16/models/user_model.dart';

class ChatModel {
  UserModel user1;
  UserModel user2;
  String id;
  String chatCreatedTime;
  List<Message> messages;

  ChatModel({
    required this.id,
    required this.user1,
    required this.user2,
    required this.chatCreatedTime,
    required this.messages,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    List<Message> allMessages = [];
    final list = json['messages'];
    for (final item in list) {
      try {
        allMessages.add(Message.fromMap(item));
      } catch (error) {
        log("Error in parsing message: ", error: error);
      }
    }

    return ChatModel(
      id: json['id'],
      user1: UserModel.fromJson(json['user1']),
      user2: UserModel.fromJson(json['user2']),
      chatCreatedTime: json['chatCreatedTime'],
      messages: allMessages,
    );
  }
}
