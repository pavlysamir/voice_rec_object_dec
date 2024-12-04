import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakers_task/core/theming/colors.dart';
import 'package:pyramakers_task/core/theming/styles.dart';
import 'package:pyramakers_task/core/widgets/custom_app_bar.dart';
import 'package:pyramakers_task/core/widgets/custom_button_small.dart';
import 'package:pyramakers_task/features/voice_recognztion/logic/voice_cubit.dart';

class VoiceRecognationScreen extends StatelessWidget {
  const VoiceRecognationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subAppBar(
        context,
        title: 'Voice Recognition',
        isLeading: false,
      ),
      body: BlocProvider(
        create: (context) => VoiceCubit()..initSpeech(),
        child: BlocBuilder<VoiceCubit, VoiceState>(builder: (context, state) {
          final voiceCubit = BlocProvider.of<VoiceCubit>(context);
          //  voiceCubit.initSpeech();

          return Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Tap to change Language: ",
                    style: TextStyles.font14BlueRegular,
                  ),
                  CustomButtonSmall(
                    width: 100.w,
                    borderColor: ColorsManager.mainBlue,
                    color: ColorsManager.white,
                    textColortcolor: ColorsManager.mainBlue,
                    function: () {
                      voiceCubit.changeLanguage();
                    },
                    text: voiceCubit.isEnglish ? 'en' : 'ar',
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  voiceCubit.speechToText.isListening
                      ? "Listening..."
                      : voiceCubit.speechEnabled
                          ? "Tap Listen to start listening..."
                          : "Speech not available",
                  style: const TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  voiceCubit.wordsSpoken,
                  style: TextStyles.font24BlackRegular,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              if (voiceCubit.speechToText.isNotListening &&
                  voiceCubit.confidenceLevel > 0)
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Text(
                      "Confidence: ${(voiceCubit.confidenceLevel * 100).toStringAsFixed(1)}%",
                      style: TextStyles.font12BlueRegular),
                ),
              CustomButtonSmall(
                width: 200.w,
                borderColor: ColorsManager.mainBlue,
                color: ColorsManager.white,
                textColortcolor: ColorsManager.mainBlue,
                function: voiceCubit.speechToText.isListening
                    ? voiceCubit.stopListening
                    : voiceCubit.startListening,
                text: voiceCubit.speechToText.isNotListening
                    ? 'Listen'
                    : 'StopListening',
              ),
            ]),
          ));
        }),
      ),
    );
  }
}
