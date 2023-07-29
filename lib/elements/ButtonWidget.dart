import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:ui_test/configs/AppColors.dart';
import 'package:ui_test/configs/AppConst.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget(
      {Key? key,
       this.textColor,
        this.backgroundColor,
      this.border_color,
      this.textSize,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Color? textColor;
  final Color? backgroundColor;
  final Color? border_color;
  final double? textSize;
  final String text;
  final VoidCallback onPressed;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58,
      height: 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            // foregroundColor: widget.backgroundColor ?? AppColors.apptheme ,
            backgroundColor:widget.backgroundColor ?? AppColors.apptheme ,
            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 12),
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999))),
        onPressed: () {
        },

        child: Text(
            widget.text.tr,
            style: TextStyle(
              fontFamily: "NotoSans",
              color: widget.textColor ?? AppColors.white,
              fontWeight: FontWeight.w500, letterSpacing: -0.12,
              fontSize: widget.textSize ?? 12
            )),
      ),
    );
  }
}

class ButtonWidgetWithoutEffect extends StatelessWidget {
  const ButtonWidgetWithoutEffect(
      {Key? key,
      required this.color,
      required this.backgroundColor,
      this.border_color,
      this.textSize,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Color color;
  final Color backgroundColor;
  final Color? border_color;
  final double? textSize;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w >= 450 ? 60.w : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: backgroundColor,
            padding: EdgeInsets.all(100.w >= 600 ? 1.3.h : 2.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onPressed,
        child: Text(text.tr,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: textSize ?? 12,
            )),
      ),
    );
  }
}
