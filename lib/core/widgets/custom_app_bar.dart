import 'package:flutter/material.dart';
import 'package:pyramakers_task/core/widgets/custom_text.dart';
import '../theming/colors.dart';

AppBar subAppBar(context,
    {String? title, bool isSearch = false, bool isLeading = true}) {
  return AppBar(
    backgroundColor: ColorsManager.white,
    toolbarHeight: 80,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    forceMaterialTransparency: true,
    leading: isLeading
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            color: ColorsManager.mainBlue,
          )
        : const SizedBox(),
    title: title != null
        ? RegularText(
            text: title ?? '',
            color: ColorsManager.mainBlue,
            fontWeight: FontWeight.normal,
            size: 20,
          )
        : null,
    actions: [
      isSearch
          ? IconButton(
              onPressed: () {},
              icon: const Icon(Icons.local_activity),
              color: ColorsManager.mainBlue,
              iconSize: 30,
              padding: const EdgeInsets.symmetric(horizontal: 20),
            )
          : const SizedBox(),
    ],
  );
}
