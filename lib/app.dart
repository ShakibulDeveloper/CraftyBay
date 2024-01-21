import 'package:crafty_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "CraftyBay",
      home: const MainBottomNavScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.appThemeData,
    );
  }
}
