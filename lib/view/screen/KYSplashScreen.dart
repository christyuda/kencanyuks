import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kencanyuks/view/screen/KYWalkThroughScreen.dart';

class KYSplashScreen extends StatefulWidget {
  const KYSplashScreen({super.key});

  @override
  State<KYSplashScreen> createState() => _KYSplashScreenState();
}

class _KYSplashScreenState extends State<KYSplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const KYWalkThroughScreen());
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png',
            fit: BoxFit.cover, height: 200, width: 200),
      ),
    );
  }
}
