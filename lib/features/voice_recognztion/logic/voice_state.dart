part of 'voice_cubit.dart';

@immutable
sealed class VoiceState {}

final class LoginInitial extends VoiceState {}

final class VoiceInitial extends VoiceState {}

final class VoiceResultState extends VoiceState {
  // final String text;
  // final double confidence;
  VoiceResultState();
}

final class VoiceStopState extends VoiceState {}

final class VoiceListeningState extends VoiceState {}

final class ChangeLanguage extends VoiceState {}
