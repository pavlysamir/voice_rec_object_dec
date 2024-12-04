import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakers_task/core/layout/logic/home_layout_cubit.dart';
import 'package:pyramakers_task/core/theming/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);

          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BottomNavigationBar(
                  elevation: 0,
                  iconSize: 18,
                  backgroundColor: Colors.transparent,
                  selectedFontSize: 12,
                  selectedIconTheme:
                      const IconThemeData(color: ColorsManager.darkBlue),
                  unselectedIconTheme:
                      const IconThemeData(color: ColorsManager.lightBlue),
                  selectedItemColor: ColorsManager.darkBlue,
                  unselectedItemColor: ColorsManager.lightBlue,
                  type: BottomNavigationBarType.fixed,
                  mouseCursor: MouseCursor.defer,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        size: 20,
                        Icons.voice_chat,
                      ),
                      label: 'Voice Recognition',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        size: 20,
                        Icons.camera,
                      ),
                      label: 'Obgect Recognition',
                    ),
                  ],
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomNavBar(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
