import 'package:fire16/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatelessWidget {
  final Message message;
  final String myID;

  const MessageScreen({
    super.key,
    required this.message,
    required this.myID,
  });

  @override
  Widget build(BuildContext context) {
    final byMe = message.senderID == myID;
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
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.text,
            style: const TextStyle(
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
              Text(
                DateFormat('hh:mm').format(
                  DateTime.parse(message.sendTime),
                ),
                style: const TextStyle(
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
