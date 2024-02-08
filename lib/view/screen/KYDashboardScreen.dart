import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:nb_utils/nb_utils.dart';

class KYDashboardScreen extends StatelessWidget {
  final currentIndex = 0.obs;
  final List<Widget> tabs = [];

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
