import 'package:blizz_chat/features/messaging/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagingPage extends ConsumerStatefulWidget {
  final Map<String, dynamic> chat;
  const MessagingPage({required this.chat, super.key});

  @override
  ConsumerState<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends ConsumerState<MessagingPage> {
  late TextEditingController msgController;
  late FocusNode focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
    msgController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    msgController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            Container(
              margin: const EdgeInsets.only(right: 13.0),
              child: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            Text(widget.chat['name']),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))],
      ),
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  MessageBubble(
                    onReply: () {
                      focusNode.requestFocus();
                    },
                    type: MessageType.to,
                    msg: 'Hello',
                  ),
                  MessageBubble(
                    onReply: () {
                      focusNode.requestFocus();
                    },
                    type: MessageType.from,
                    msg: 'Hi!',
                  ),
                  MessageBubble(
                    onReply: () {
                      focusNode.requestFocus();
                    },
                    type: MessageType.to,
                    msg: 'Wassup?',
                  ),
                  MessageBubble(
                    onReply: () {
                      focusNode.requestFocus();
                    },
                    type: MessageType.from,
                    msg: 'Im fine, how bout you?',
                  ),
                  MessageBubble(
                    onReply: () {
                      focusNode.requestFocus();
                    },
                    type: MessageType.to,
                    msg: 'Great!',
                  ),
                  MessageBubble(
                    onReply: () {
                      focusNode.requestFocus();
                    },
                    type: MessageType.to,
                    msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                  ),
                ],
              ),
            ),
            BottomAppBar(
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
                                focusNode: focusNode,
                                decoration:
                                    const InputDecoration(hintText: 'Message something', border: InputBorder.none),
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined))
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
