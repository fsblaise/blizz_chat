import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/messaging/application/messaging_controller.dart';
import 'package:blizz_chat/features/messaging/presentation/widgets/bottom_messaging_bar.dart';
import 'package:blizz_chat/features/messaging/presentation/widgets/message_bubble.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

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
    final messagingController = ref.read(messagingControllerProvider(widget.chat['id']).notifier);
    messagingController.addMessage(text);
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
              AsyncValue(:final error?) => Text(_i10n.somethingWentWrong),
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
