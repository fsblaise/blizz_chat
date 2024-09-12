import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MessagingPage extends StatefulWidget {
  const MessagingPage({
    @PathParam('chatId') required this.chatId,
    super.key,
  });

  final String chatId;

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  late final MessagingCubit _messagingCubit;
  late final Chat? _chat;

  @override
  void initState() {
    _messagingCubit = context.read<MessagingCubit>();

    _chat = context.read<ChatsCubit>().getChat(widget.chatId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_chat?.title ?? 'Untitled'),
      ),
      body: BlocBuilder<MessagingCubit, MessagingState>(
        builder: (context, state) {
          return Center(
            child: TextButton(
              onPressed: () async {},
              child: const Text('asd'),
            ),
          );
        },
      ),
    );
  }
}
