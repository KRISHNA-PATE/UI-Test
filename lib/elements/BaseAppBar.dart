
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../configs/AppAssets.dart';
import '../configs/AppColors.dart';
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
      actions:[
        IconButton(
        icon: Image.asset(AppAssets.ic_notification,width:24,height: 24), onPressed: () {  },)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}