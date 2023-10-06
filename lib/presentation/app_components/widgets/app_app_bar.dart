import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import '../../app_ui/app_color/app_color.dart';
import '../../app_ui/app_image/app_image.dart';
import '../../app_ui/app_text/app_text.dart';
import 'app_asset_button.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final bool backIsActive;
  const AppAppBar({required this.backIsActive, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backIsActive
          ? AppAssetButton(
              name: AppImage.instance.iconArrowLeft,
              height: 24,
              width: 24,
              onTap: (() => Get.back()))
          : const SizedBox(),
      backgroundColor: AppColor.instance.rentalWhite,
      centerTitle: true,
      elevation: 0.0,
      title: Text(
        text ?? "",
        style: AppText.instance.bold_24px,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
