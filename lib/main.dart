import 'package:flutter/material.dart';
import 'package:rental_app/business_logic/managers/notification_manager.dart';
import 'package:rental_app/core/init/auth/local_auth_manager.dart';
import 'package:rental_app/presentation/pages/auth_page/view/auth_view.dart';
import 'package:rental_app/rental_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initalizeApp();
  await NotificationManager().initLocalNotifications();
  LocalAuthManager().authenticate();
}

void initalizeApp() {
  final Widget home;
  home = const AuthView();
  runApp(RentalApp(home: home));
}
