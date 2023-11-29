import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

enum MessageType { to, from }

class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.msg, required this.type, required this.onReply, super.key});
  final String msg;
  final MessageType type;
  final Function() onReply;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: SwipeTo(
        offsetDx: 0.2,
        onLeftSwipe: type == MessageType.from ? onReply : null,
        onRightSwipe: type == MessageType.from ? null : onReply,
        child: Row(
          mainAxisAlignment: type == MessageType.from ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Flexible(
                child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: type == MessageType.from ? Colors.deepPurple : Colors.grey.shade200,
                ),
                child: Text(
                  msg,
                  style: TextStyle(color: type == MessageType.from ? Colors.white : Colors.black, fontSize: 15),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
