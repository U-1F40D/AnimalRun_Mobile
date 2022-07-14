import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'homepage.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MyApp(
    camera: firstCamera
  ),);
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimalRun App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'AnimalRun',
        camera: camera
        ),
    );
  }
}

