import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/messaging/application/messaging_controller.dart';
import 'package:blizz_chat/features/messaging/infrastructure/messaging_provider.dart';
import 'package:blizz_chat/features/messaging/presentation/widgets/bottom_messaging_bar.dart';
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
  late FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  void _sendMessage(String text) {
    final messagingController = ref.read(messagingRepositoryProvider.call(widget.chat['id']));
    messagingController.addMessage(text);
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(MessagingControllerProvider(widget.chat['id']));
    final user = ref.watch(loggedInUserProvider);
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
            switch (messages) {
              AsyncValue(:final error?) => const Text('Something went wrong!'),
              AsyncValue(:final valueOrNull?) => Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    reverse: true,
                    children: [
                      ...valueOrNull.map((e) => MessageBubble(
                          msg: e.text,
                          type: e.from == user!.uid ? MessageType.from : MessageType.to,
                          onReply: () {
                            _focusNode.requestFocus();
                          })),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Hello',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.from,
                      //   msg: 'Hi!',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Wassup?',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.from,
                      //   msg: 'Im fine, how bout you?',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Great!',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                      // MessageBubble(
                      //   onReply: () {
                      //     focusNode.requestFocus();
                      //   },
                      //   type: MessageType.to,
                      //   msg: 'Actually ive just learned flutteraaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                      // ),
                    ],
                  ),
                ),
              _ => const Center(
                  child: CircularProgressIndicator(),
                )
            },
            BottomMessagingBar(
              focusNode: _focusNode,
              sendMessage: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
