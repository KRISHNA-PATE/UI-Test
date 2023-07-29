
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_test/configs/AppAssets.dart';
import 'package:ui_test/configs/AppColors.dart';
import 'package:ui_test/configs/AppConst.dart';

import 'TitleText.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BaseAppBar({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: TitleText(text: title),
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.white,
      leading: IconButton(
        icon: Image.asset(AppAssets.ic_back_arrow,width:24,height: 24), onPressed: () {  },),
      actions:[
        IconButton(
        icon: Image.asset(AppAssets.ic_notification,width:24,height: 24), onPressed: () {  },)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}