import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';

class RegularText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final bool center;
  final bool lineThrough;
  final FontWeight fontWeight;
  final int? maxLines;

  const RegularText({
    Key? key,
    required this.text,
    this.color,
    this.size,
    this.maxLines,
    this.center = false,
    this.lineThrough = false,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: center ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        height: 1.3,
        color: color ?? Colors.black,
        fontSize: size ?? 13,
        fontWeight: fontWeight,
        decoration:
            lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final bool center;
  final void Function() onTap;
  final FontWeight fontWeight;

  const ButtonText({
    Key? key,
    required this.text,
    this.color,
    this.size,
    required this.onTap,
    this.center = false,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: center ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          height: 1.3,
          color: color ?? ColorsManager.blackColor,
          fontSize: size ?? 12.sp,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
