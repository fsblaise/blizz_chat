import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/messaging/message_dtos.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:blizz_chat/ui/views/messaging/view/bottom_messaging_bar.dart';
import 'package:blizz_chat/ui/views/messaging/view/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class MessagingPage extends StatefulWidget {
  const MessagingPage({
    @PathParam('chatId') required this.chatId,
    @PathParam('title') required this.title,
    super.key,
  });
  final String chatId;
  final String title;

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  late final MessagingCubit _messagingCubit;
  late final AuthCubit _authCubit;
  late final Chat? _chat;
  late final UserProfile? _user;
  late FocusNode _focusNode;

  @override
  void initState() {
    _messagingCubit = context.read<MessagingCubit>();
    _authCubit = context.read<AuthCubit>();
    _user = _authCubit.getCurrentUser();
    _chat = context.read<ChatsCubit>().getChat(widget.chatId);
    _messagingCubit.fetchMessages(_chat, _user?.email);
    _focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  void _sendMessage(String text) {
    print(text);
    final toParticipants = _chat?.participants
        .where((participant) => participant.email != _user?.email)
        .map((participant) => participant.email)
        .toList();

    if (toParticipants != null && toParticipants.isNotEmpty) {
      _messagingCubit.sendMessage(
        MessageDto(
          id: const Uuid().v4(),
          message: text,
          messageType: 0,
          from: _user?.email ?? '',
          to: toParticipants,
          chatId: widget.chatId,
          timestamp: DateTime.now().toIso8601String(),
        ),
      );
    }
    _focusNode.unfocus();
  }

  Widget _buildMessaging(List<Message> messages) {
    return GestureDetector(
      onTap: () => {
        FocusScope.of(context).unfocus(),
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ListView(
              shrinkWrap: true,
              reverse: true,
              children: [
                if (messages.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Center(
                      child: Text(
                        'No messages yet, start chatting!',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ...messages.map(
                  (e) => MessageBubble(
                    msg: e.message,
                    type: e.from == _user?.email
                        ? MessageType.from
                        : MessageType.to,
                    onReply: (DragUpdateDetails details) {
                      _focusNode.requestFocus();
                    },
                    delete: () => _messagingCubit.deleteMessage(e.id),
                  ),
                ),
              ],
            ),
          ),
          BottomMessagingBar(
            focusNode: _focusNode,
            sendMessage: _sendMessage,
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              context.router.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Container(
            margin: const EdgeInsets.only(right: 13),
            child: const CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          Text(widget.title),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final messages = <Message>[];
    // for (var i = 0; i < 15; i++) {
    //   messages.add(
    //     Message(
    //       message: 'Mock message $i',
    //       from: i.isEven ? 'user1' : 'user2',
    //       to: i.isOdd ? 'user1' : 'user2',
    //       id: '',
    //       timestamp: DateTime.now().toIso8601String(),
    //       chatId: widget.chatId,
    //     ),
    //   );
    // }

    // final user = 'user1';

    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<MessagingCubit, MessagingState>(
        builder: (context, state) {
          if (state is MessagingFetched) {
            return _buildMessaging(state.messages);
          } else if (state is MessagingError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}
