import 'package:flutter/material.dart';
import '../../app_ui/app_color/app_color.dart';
import 'app_image_widget.dart';

class AppAssetButton extends StatelessWidget {
  final String name;
  final double? height;
  final double? width;
  final void Function() onTap;
  final Color? color;
  const AppAssetButton({
    required this.name,
    this.height,
    this.width,
    required this.onTap,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppImageWidget(
        name: name,
        height: height ?? 24,
        width: width ?? 24,
        color: color ?? AppColor.instance.rentalBlack,
      ),
    );
  }
}
