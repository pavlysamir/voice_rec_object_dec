import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakers_task/core/layout/logic/home_layout_cubit.dart';
import 'package:pyramakers_task/core/routing/app_router.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
