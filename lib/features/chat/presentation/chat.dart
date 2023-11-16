import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const Text('Person Name'),
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
                  Container(
                    color: Colors.blue,
                    height: 150,
                  ),
                  Container(
                    color: Colors.red,
                    height: 150,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 150,
                  ),
                  Container(
                    color: Colors.red,
                    height: 150,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 150,
                  ),
                  Container(
                    color: Colors.blue,
                    height: 150,
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
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(hintText: 'Message something', border: InputBorder.none),
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

class Items extends StatelessWidget {
  const Items({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
