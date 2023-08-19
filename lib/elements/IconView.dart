
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TitleText.dart';

class IconView extends StatelessWidget  {
  final String icon;
  final double? iconHeight;
  final double? iconWidth;
  final BoxFit? boxFit;

  const IconView({Key? key, required this.icon,  this.iconHeight,  this.iconWidth, this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
        child: Image.asset(icon,height: iconHeight ?? 32 ,width:iconWidth ?? 32,fit: boxFit ?? BoxFit.fill,));
  }
}