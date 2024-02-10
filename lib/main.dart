import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kencanyuks/store/AppStore.dart';
import 'package:kencanyuks/view/screen/KYSplashScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'firebase_options.dart';
import 'package:kencanyuks/services/FirebaseService.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppStore appStore = AppStore();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isDarkModeOnPref = preferences.getBool('isDarkModeOnPref') ?? false;
  appStore = AppStore();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(FirebaseService());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dating App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KYSplashScreen(),
    );
  }
}
