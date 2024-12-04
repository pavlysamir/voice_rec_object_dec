import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:pyramakers_task/features/object_decetion/logic/object_cubit.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  ObjectCubit? objectCubit;
  @override
  void initState() {
    super.initState();
    objectCubit = ObjectCubit.get(context);
    objectCubit!.initCamera();
  }

  @override
  void dispose() {
    objectCubit!.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: objectCubit!,
      child: BlocBuilder<ObjectCubit, ObjectState>(
        builder: (context, state) {
          var tmp = MediaQuery.of(context).size;
          var screenH = math.max(tmp.height, tmp.width);
          var screenW = math.min(tmp.height, tmp.width);
          tmp = ObjectCubit.get(context)!.controller!.value.previewSize!;
          var previewH = math.max(tmp.height, tmp.width);
          var previewW = math.min(tmp.height, tmp.width);
          var screenRatio = screenH / screenW;
          var previewRatio = previewH / previewW;
          if (ObjectCubit.get(context)!.controller!.value.isInitialized) {
            return Container();
          }
          return OverflowBox(
            maxHeight: screenRatio > previewRatio
                ? screenH
                : screenW / previewW * previewH,
            maxWidth: screenRatio > previewRatio
                ? screenH / previewH * previewW
                : screenW,
            child: CameraPreview(ObjectCubit.get(context)!.controller!),
          );
        },
      ),
    );
  }
}
