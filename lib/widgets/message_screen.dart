import 'package:flutter/material.dart';

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
