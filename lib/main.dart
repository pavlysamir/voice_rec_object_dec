import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakers_task/core/simple_bloc_observer.dart';
import 'package:pyramakers_task/task_app.dart';
import 'package:tflite_v2/tflite_v2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    String? res = await Tflite.loadModel(
      model: "assets/ssd_mobilenet.tflite",
      labels: "assets/ssd_mobilenet.txt",
    );
    print("Model loaded successfully: $res");
  } catch (e) {
    print("Error loading model: $e");
  }

  Bloc.observer = SimpleBlocObserver();

  runApp(const TaskApp());
}
