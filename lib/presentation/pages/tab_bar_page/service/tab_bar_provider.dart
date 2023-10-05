import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTabProvider extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: 3);
    //startStream();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
