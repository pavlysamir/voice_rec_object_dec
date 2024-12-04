import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakers_task/core/theming/colors.dart';
import 'package:pyramakers_task/core/widgets/custom_app_bar.dart';
import 'package:pyramakers_task/core/widgets/custom_button_small.dart';
import 'package:pyramakers_task/features/object_decetion/logic/object_cubit.dart';
import 'package:pyramakers_task/features/object_decetion/ui/screens/camera.dart';
import 'package:pyramakers_task/features/object_decetion/ui/widgets/bndbox.dart';
import 'dart:math' as math;

import '../../data/models.dart';

class ObgectDecetionScreen extends StatelessWidget {
  const ObgectDecetionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subAppBar(context, title: 'Object Detection', isLeading: false),
      body: BlocProvider(
        create: (context) => ObjectCubit()
          ..initCameras()
          ..initCamera(),
        child: BlocBuilder<ObjectCubit, ObjectState>(builder: (context, state) {
          var cubit = ObjectCubit.get(context)!;
          Size screen = MediaQuery.of(context).size;
          return Scaffold(
            body: cubit.model == ""
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomButtonSmall(
                            color: ColorsManager.white,
                            textColortcolor: ColorsManager.mainBlue,
                            width: 150,
                            function: () {
                              cubit.onSelect(ssd);
                            },
                            text: ssd,
                            borderColor: ColorsManager.mainBlue),
                        CustomButtonSmall(
                            color: ColorsManager.white,
                            textColortcolor: ColorsManager.mainBlue,
                            width: 150,
                            function: () {
                              cubit.onSelect(yolo);
                            },
                            text: yolo,
                            borderColor: ColorsManager.mainBlue),
                        CustomButtonSmall(
                            color: ColorsManager.white,
                            textColortcolor: ColorsManager.mainBlue,
                            width: 150,
                            function: () {
                              cubit.onSelect(mobilenet);
                            },
                            text: mobilenet,
                            borderColor: ColorsManager.mainBlue),
                        CustomButtonSmall(
                            color: ColorsManager.white,
                            textColortcolor: ColorsManager.mainBlue,
                            width: 150,
                            function: () {
                              cubit.onSelect(posenet);
                            },
                            text: posenet,
                            borderColor: ColorsManager.mainBlue),
                      ],
                    ),
                  )
                : Stack(
                    children: [
                      const Camera(),
                      BndBox(
                          cubit.recognitions ?? [],
                          math.max(cubit.imageHeight, cubit.imageWidth),
                          math.min(cubit.imageHeight, cubit.imageWidth),
                          screen.height,
                          screen.width,
                          cubit.model),
                    ],
                  ),
          );
        }),
      ),
    );
  }
}
