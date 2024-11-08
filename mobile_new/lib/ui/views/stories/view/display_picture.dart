import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DisplayPicturePage extends StatefulWidget {
  const DisplayPicturePage({required this.imgPath, super.key});
  final String imgPath;

  @override
  State<DisplayPicturePage> createState() => _DisplayPicturePageState();
}

class _DisplayPicturePageState extends State<DisplayPicturePage> {
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
    // final storiesController = ref.read(storiesControllerProvider.notifier);
    // await storiesController.addStory(caption, File(widget.imgPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text('Confirmation'),
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
                            hintText: 'Message something',
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
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                    await _uploadPicture(
                                        captionController.text);
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
