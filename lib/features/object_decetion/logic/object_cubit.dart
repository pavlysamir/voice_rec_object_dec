import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pyramakers_task/features/object_decetion/data/models.dart';
import 'package:tflite_v2/tflite_v2.dart';
part 'object_state.dart';

class ObjectCubit extends Cubit<ObjectState> {
  ObjectCubit() : super(ObjectInitial());

  static ObjectCubit? get(context) => BlocProvider.of(context);

  List<dynamic>? recognitions;
  int imageHeight = 0;
  int imageWidth = 0;
  String model = "";

  List<CameraDescription>? cameras;
  Future<void> initCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      print('Error: $e.code\nError Message: $e.message');
    }
  }

  loadModel() async {
    String? res;
    switch (model) {
      case yolo:
        res = await Tflite.loadModel(
          model: "assets/yolov2_tiny.tflite",
          labels: "assets/yolov2_tiny.txt",
        );
        break;

      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/mobilenet_v1_1.0_224.tflite",
            labels: "assets/mobilenet_v1_1.0_224.txt");
        break;

      case posenet:
        res = await Tflite.loadModel(
            model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/ssd_mobilenet.tflite",
            labels: "assets/ssd_mobilenet.txt");
    }
    if (kDebugMode) {
      print(res);
    }
  }

  onSelect(model) {
    model = model;
    emit(OnSelect());

    // setState(() {
    // });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    recognitions = recognitions;
    imageHeight = imageHeight;
    imageWidth = imageWidth;

    emit(SetRecognation());
    //   setState(() {

    //   });
  }

  CameraController? controller;
  bool isDetecting = false;

  initCamera() {
    if (cameras == null || cameras!.isEmpty) {
      print('No camera is found');
    } else {
      controller = CameraController(
        cameras![0],
        ResolutionPreset.high,
      );
      controller!.initialize().then((_) {
        // if (!mounted) {
        //   return;
        // }
        // setState(() {});
        emit(InitCamera());

        controller!.startImageStream((CameraImage img) {
          if (!isDetecting) {
            isDetecting = true;

            int startTime = new DateTime.now().millisecondsSinceEpoch;

            if (model == mobilenet) {
              Tflite.runModelOnFrame(
                bytesList: img.planes.map((plane) {
                  return plane.bytes;
                }).toList(),
                imageHeight: img.height,
                imageWidth: img.width,
                numResults: 2,
              ).then((recognitions) {
                int endTime = new DateTime.now().millisecondsSinceEpoch;
                print("Detection took ${endTime - startTime}");

                setRecognitions(recognitions, img.height, img.width);

                isDetecting = false;
              });
            } else if (model == posenet) {
              Tflite.runPoseNetOnFrame(
                bytesList: img.planes.map((plane) {
                  return plane.bytes;
                }).toList(),
                imageHeight: img.height,
                imageWidth: img.width,
                numResults: 2,
              ).then((recognitions) {
                int endTime = new DateTime.now().millisecondsSinceEpoch;
                print("Detection took ${endTime - startTime}");

                setRecognitions(recognitions, img.height, img.width);

                isDetecting = false;
              });
            } else {
              Tflite.detectObjectOnFrame(
                bytesList: img.planes.map((plane) {
                  return plane.bytes;
                }).toList(),
                model: model == yolo ? "YOLO" : "SSDMobileNet",
                imageHeight: img.height,
                imageWidth: img.width,
                imageMean: model == yolo ? 0 : 127.5,
                imageStd: model == yolo ? 255.0 : 127.5,
                numResultsPerClass: 1,
                threshold: model == yolo ? 0.2 : 0.4,
              ).then((recognitions) {
                int endTime = new DateTime.now().millisecondsSinceEpoch;
                print("Detection took ${endTime - startTime}");

                setRecognitions(recognitions, img.height, img.width);

                isDetecting = false;
              });
            }
          }
        });
      });
    }
  }
}
