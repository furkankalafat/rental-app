import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImageWidget extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Color? color;
  const AppImageWidget(
      {Key? key,
      required this.name,
      required this.height,
      required this.width,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(name),
      height: height.h,
      width: width.w,
      color: color,
    );
  }
}
