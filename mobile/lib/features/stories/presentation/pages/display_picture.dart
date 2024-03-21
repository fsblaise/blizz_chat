import 'dart:io';

import 'package:blizz_chat/features/stories/application/stories_controller.dart';
import 'package:blizz_chat/l10n/generated/l10n.dart';
import 'package:blizz_chat/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final I10n _i10n = locator<I10n>();

class DisplayPicturePage extends ConsumerStatefulWidget {
  const DisplayPicturePage({required this.imgPath, super.key});
  final String imgPath;

  @override
  ConsumerState<DisplayPicturePage> createState() => _DisplayPicturePageState();
}

class _DisplayPicturePageState extends ConsumerState<DisplayPicturePage> {
  late TextEditingController captionController;
  late bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    captionController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    captionController.dispose();
  }

  Future<void> _uploadPicture(String caption) async {
    final storiesController = ref.read(storiesControllerProvider.notifier);
    await storiesController.addStory(caption, File(widget.imgPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text(_i10n.confirmation),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 5,
                  child: Image.file(
                    File(widget.imgPath),
                    fit: BoxFit.fill,
                  )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: captionController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: _i10n.messageSomething,
                            border: const UnderlineInputBorder(),
                            hintStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: !loading
                      ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          IconButton.outlined(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close_outlined),
                            color: Colors.white,
                            iconSize: 36,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton.outlined(
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              try {
                                await _uploadPicture(captionController.text);
                              } finally {
                                setState(() {
                                  loading = false;
                                });
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                            },
                            icon: const Icon(Icons.done_outlined),
                            color: Colors.white,
                            iconSize: 36,
                          ),
                        ])
                      : const Center(child: CircularProgressIndicator()),
                ),
              )
            ],
          ),
        ));
  }
}
