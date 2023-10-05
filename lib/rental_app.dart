import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:rental_app/presentation/pages/auth_page/view/auth_view.dart';
import 'package:rental_app/presentation/pages/rental_page/view/rental_view.dart';

class RentalApp extends StatefulWidget {
  final Widget home;
  const RentalApp({
    required this.home,
    super.key,
  });

  @override
  State<RentalApp> createState() => _RentalAppState();
}

class _RentalAppState extends State<RentalApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: (() => const AuthView())),
          GetPage(name: "/rental", page: (() => const RentalView())),
        ],
        home: child,
      ),
      child: widget.home,
    );
  }
}
