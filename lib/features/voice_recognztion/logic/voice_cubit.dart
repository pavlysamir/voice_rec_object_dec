import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'voice_state.dart';

class VoiceCubit extends Cubit<VoiceState> {
  VoiceCubit() : super(LoginInitial());

  static VoiceCubit? get(context) => BlocProvider.of(context);

  final SpeechToText speechToText = SpeechToText();

  bool speechEnabled = false;
  String wordsSpoken = "";
  double confidenceLevel = 0;
  String selectedLocaleId = "en-US";

  void initSpeech() async {
    speechEnabled = await speechToText.initialize();
    emit(VoiceInitial());
  }

  void startListening() async {
    await speechToText
        .listen(
          onResult: onSpeechResult,
          localeId: selectedLocaleId,
        )
        .then((value) => emit(VoiceListeningState()));
    // emit(VoiceListeningState());
  }

  void stopListening() async {
    await speechToText.stop();
    emit(VoiceStopState());
  }

  void onSpeechResult(result) {
    print("Speech Result: ${result.recognizedWords}");
    wordsSpoken = "${result.recognizedWords}";
    confidenceLevel = result.confidence;
    emit(VoiceResultState());
  }

  bool isEnglish = true;
  void changeLanguage() {
    isEnglish = !isEnglish;
    if (isEnglish) {
      selectedLocaleId = "en-US";
    } else {
      selectedLocaleId = "ar-SA";
    }

    emit(ChangeLanguage());
  }
}
