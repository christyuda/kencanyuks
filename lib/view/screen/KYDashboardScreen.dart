import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/routes/screen/KYHomeScreen.dart';
import 'package:kencanyuks/routes/screen/KYLoveScreen.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:nb_utils/nb_utils.dart';

class KYDashboardScreen extends StatefulWidget {
  @override
  State<KYDashboardScreen> createState() => _KYDashboardScreenState();
}

class _KYDashboardScreenState extends State<KYDashboardScreen> {
  final currentIndex = 0.obs;
  List<Widget> tabs = [KYHomeScreen(), KYLoveScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => tabs[currentIndex.value]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex.value,
        backgroundColor: context.cardColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Get.isDarkMode ? Colors.white : Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          currentIndex.value = index;
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
