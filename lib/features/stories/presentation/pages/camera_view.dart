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
      _controller.dispose();
    } catch (e) {
      print(e);
    }
  }

  _switchCamera() {
    final lensDirection = _controller.description.lensDirection;
    if (lensDirection == CameraLensDirection.front) {
      _initCamera(widget.cameras.firstWhere((description) => description.lensDirection == CameraLensDirection.back));
    } else {
      _initCamera(widget.cameras.firstWhere((description) => description.lensDirection == CameraLensDirection.front));
    }
  }

  // init camera
  Future<void> _initCamera(CameraDescription description) async {
    _controller = CameraController(description, ResolutionPreset.medium, enableAudio: true);

    try {
      _initializeControllerFuture = _controller.initialize();
      // to notify the widgets that camera has been initialized and now camera preview can be done
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    _initCamera(widget.cameras.first);
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
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton.outlined(
                              onPressed: _switchCamera,
                              icon: const Icon(Icons.cameraswitch_outlined),
                              color: Colors.white,
                              iconSize: 36,
                            )
                          ])),
                    ),
                  )
                ],
              );
            } else {
              return Container(
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
