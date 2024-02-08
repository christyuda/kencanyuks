import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kencanyuks/view/screen/KYWalkThroughScreen.dart';

class KYSplashScreen extends StatefulWidget {
  @override
  State<KYSplashScreen> createState() => _KYSplashScreenState();
}

class _KYSplashScreenState extends State<KYSplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(KYWalkThroughScreen());
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png',
            fit: BoxFit.cover, height: 200, width: 200),
      ),
    );
  }
}
