import 'package:blizz_chat/features/stories/presentation/pages/display_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraViewPage extends StatefulWidget {
  const CameraViewPage({required this.cameras, super.key});
  final List<CameraDescription> cameras;

  @override
  State<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      if (!mounted) return;
      await Navigator.push(context, CupertinoPageRoute(builder: (context) => DisplayPicturePage(imgPath: image.path)));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Create your story'),
      ),
      body: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  CameraPreview(_controller),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                          color: Colors.black,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            IconButton.outlined(
                              onPressed: _takePicture,
                              icon: const Icon(Icons.camera_alt),
                              color: Colors.white,
                              iconSize: 36,
                            )
                          ])),
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
