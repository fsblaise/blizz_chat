import 'package:flutter/material.dart';

class BottomMessagingBar extends StatefulWidget {
  const BottomMessagingBar({
    required this.focusNode,
    required this.sendMessage,
    super.key,
  });
  final Function(String) sendMessage;
  final FocusNode focusNode;

  @override
  State<BottomMessagingBar> createState() => _BottomMessagingBarState();
}

class _BottomMessagingBarState extends State<BottomMessagingBar> {
  late TextEditingController msgController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msgController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    msgController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromRGBO(150, 150, 150, 0.2),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.emoji_emotions_outlined),
                    ),
                    Expanded(
                      child: TextField(
                        onSubmitted: msgController.text.isNotEmpty
                            ? (value) {
                                setState(() {
                                  widget.sendMessage(msgController.text);
                                  msgController.clear();
                                });
                              }
                            : null,
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: msgController,
                        focusNode: widget.focusNode,
                        decoration: const InputDecoration(
                          hintText: 'Message something',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_outlined),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton.filled(
            onPressed: msgController.text.isNotEmpty
                ? () {
                    widget.sendMessage(msgController.text);
                    msgController.clear();
                  }
                : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
