import 'package:flutter/material.dart';
import 'package:ultralytics_yolo/yolo_task.dart';
import 'package:ultralytics_yolo/yolo_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  YoloViewController? controller;
  String result = "";

  initController() {
    try {
      controller = YoloViewController();
      controller?.setThresholds(confidenceThreshold: 0.5, iouThreshold: 0.45);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/home.jpg")),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 320,
                        width: 320,
                        child: Image.asset("assets/camera.jpg"),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          initController();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 35),
                          height: 320,
                          width: 320,
                          child:
                              controller == null
                                  ? Container()
                                  : YoloView(
                                    controller: controller,
                                    task: YOLOTask.detect,
                                    modelPath: 'assets/models/yolo11s.pt',
                                    onResult: (results) {
                                      for (var res in results) {
                                        result +=
                                            '${res.className} - ${res.confidence}\n\n';
                                      }
                                    },
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),

                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 55.0),
                    child: SingleChildScrollView(
                      child: Text(
                        result,
                        style: TextStyle(
                          backgroundColor: Colors.black87,
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
