import 'package:flutter/material.dart';

class StoryViewerPage extends StatelessWidget {
  const StoryViewerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Rikárdó bőrülés',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '\u{2764}',
                    style: TextStyle(fontSize: 32, color: Colors.red),
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ), // love
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '\u{1F602}',
                    style: TextStyle(fontSize: 32),
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ), // laugh
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '\u{1F62F}',
                    style: TextStyle(fontSize: 32),
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ), // wow
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '\u{1F622}',
                    style: TextStyle(fontSize: 32),
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ), // cry
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '\u{1F44E}',
                    style: TextStyle(fontSize: 32),
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ), //
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    '\u{1F621}',
                    style: TextStyle(fontSize: 32),
                  ),
                  style: TextButton.styleFrom(
                    minimumSize: const Size(50, 50),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ), // angry
              ],
            )
          ],
        )
      ],
    );
  }
}
