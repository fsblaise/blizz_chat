import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';

final I10n _i10n = locator<I10n>();

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
                    IconButton(onPressed: () {}, icon: const Icon(Icons.emoji_emotions_outlined)),
                    Expanded(
                      child: TextField(
                        onSubmitted: msgController.text.isNotEmpty
                            ? (value) {
                                setState(() {
                                  widget.sendMessage(msgController.text);
                                });
                              }
                            : null,
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: msgController,
                        focusNode: widget.focusNode,
                        decoration: InputDecoration(hintText: _i10n.messageSomething, border: InputBorder.none),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined))
                  ],
                ),
              ),
            ),
          ),
          IconButton.filled(
            onPressed: msgController.text.isNotEmpty
                ? () {
                    widget.sendMessage(msgController.text);
                  }
                : null,
            icon: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
