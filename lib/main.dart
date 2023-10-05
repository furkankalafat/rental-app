import 'package:flutter/material.dart';
import 'package:rental_app/core/init/auth/local_auth_manager.dart';
import 'package:rental_app/presentation/pages/auth_page/view/auth_view.dart';
import 'package:rental_app/presentation/pages/rental_page/view/rental_view.dart';
import 'package:rental_app/rental_app.dart';

void main() {
  initalizeApp();
  //TODO will open
  //LocalAuthManager().authenticate();
}

void initalizeApp() {
  final Widget home;
  home = const RentalView();
  runApp(RentalApp(home: home));
}
