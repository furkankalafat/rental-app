import 'package:flutter/material.dart';
import '../../app_ui/app_color/app_color.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: CircularProgressIndicator(
          color: AppColor.instance.rentalGreen,
        )),
      ],
    );
  }
}
