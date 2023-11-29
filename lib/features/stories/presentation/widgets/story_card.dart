import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.black87),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/blizz-chat-61069.appspot.com/o/Stories%2F6KGLtvzkwKr774WqR30R.png?alt=media&token=ad959cce-7741-4ddb-a82e-e66a20f08474",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Username'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
