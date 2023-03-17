import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mlcamera/camera.dart';
import 'package:mlcamera/main.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite/tflite.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
      cameraController!.startImageStream((CameraImage imageStream) {
        cameraImage = imageStream;
        runModel();
      });
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions!.forEach((element) {
        output = element['label'];
      });
    }

    loadModel() async {
      await Tflite.loadModel(
          model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
    }

    initState() {
      super.initState();
      loadCamera();
      loadModel();
    }

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('ML Camera'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 600,
                    width: 500,
                    child: !cameraController!.value.isInitialized
                        ? Placeholder()
                        : AspectRatio(
                            aspectRatio: cameraController!.value.aspectRatio,
                            child: CameraPreview(cameraController!),
                          ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: 50,
                      width: 200,
                      child: Center(
                        child: Text("${output}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueAccent,
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
