import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pyramakers_task/core/constance.dart';
import 'package:pyramakers_task/core/layout/ui/screens/home_layout.dart';
import 'package:pyramakers_task/core/routing/routes.dart';
import 'package:pyramakers_task/features/object_decetion/ui/screens/object_decetion_screen.dart';
import 'package:pyramakers_task/features/voice_recognztion/ui/screens/voice_recognation_screen.dart';

class AppRouter {
  static final router = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: Routes.homeLayout,
      routes: [
        GoRoute(
          path: Routes.homeLayout,
          builder: (context, state) => const HomeLayout(),
        ),
        GoRoute(
          path: Routes.voiceRecognationScreen,
          builder: (context, state) => MaterialPageRoute(
            builder: (_) => const VoiceRecognationScreen(),
          ).builder(context),
        ),
        GoRoute(
          path: Routes.obgectDecetion,
          builder: (context, state) => MaterialPageRoute(
            builder: (_) => const ObgectDecetionScreen(),
          ).builder(context),
        ),
      ]);
}
