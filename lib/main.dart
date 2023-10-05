import 'package:flutter/material.dart';
import 'package:rental_app/business_logic/managers/notification_manager.dart';
import 'package:rental_app/core/init/auth/local_auth_manager.dart';
import 'package:rental_app/presentation/pages/auth_page/view/auth_view.dart';
import 'package:rental_app/presentation/pages/rental_page/view/rental_view.dart';
import 'package:rental_app/presentation/pages/tab_bar_page/view/app_tab_bar_view.dart';
import 'package:rental_app/rental_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initalizeApp();
  await NotificationManager().initLocalNotifications();
  //TODO will open
  //LocalAuthManager().authenticate();
}

void initalizeApp() {
  final Widget home;
  //TODO will change
  home = const AppTabBarView();
  runApp(RentalApp(home: home));
}
