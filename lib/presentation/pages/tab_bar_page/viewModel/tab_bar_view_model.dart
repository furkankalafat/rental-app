import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../service/tab_bar_provider.dart';

class AppTabBarViewModel extends GetxController implements BaseViewModel {
  late final AppTabProvider appTabProvider;

  void onTapTabBar(int index) {
    update();
  }

  @override
  void init() {
    appTabProvider = Get.put(AppTabProvider());
  }

  @override
  BuildContext? context;

  @override
  void setContext(BuildContext context) {}
}
