import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_test/configs/AppColors.dart';

class ContentText extends StatelessWidget {
  const ContentText({
    Key? key,
    this.textSize,
    this.color,
    required this.text,
    this.maxLine,
    this.decoration,
    this.alignment,
    this.fontWeight,
  }) : super(key: key);

  final double? textSize;
  final Color? color;
  final String text;
  final int? maxLine;
  final TextAlign? alignment;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    if(maxLine!=null) {
      return Text(text.tr,
          maxLines: maxLine,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: color ?? AppColors.normal,
            fontSize: textSize ?? 12,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontFamily: "Roboto",
            decoration: decoration??TextDecoration.none,
          ),
          textAlign: alignment ?? TextAlign.start);
    }else {
      return Text(text.tr,
          style: TextStyle(
            color: color ?? AppColors.normal,
            fontSize: textSize ?? 12,
            fontWeight: fontWeight ?? FontWeight.w400,
            fontFamily: "Roboto",
            decoration: decoration??TextDecoration.none,
          ),
          textAlign: alignment ?? TextAlign.start);
    }
  }
}