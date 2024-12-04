import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakers_task/features/object_decetion/ui/screens/object_decetion_screen.dart';
import 'package:pyramakers_task/features/voice_recognztion/ui/screens/voice_recognation_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const VoiceRecognationScreen(),
    const ObgectDecetionScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(HomeChaneNavBar());
  }
}
