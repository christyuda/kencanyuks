import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:kencanyuks/view/screen/KYSigninScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:kencanyuks/view/screen/KYCreateAccountScreen.dart';

class KYWelcomeScreen extends StatefulWidget {
  const KYWelcomeScreen({super.key});

  @override
  State<KYWelcomeScreen> createState() => _KYWelcomeScreenState();
}

class _KYWelcomeScreenState extends State<KYWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Image.asset(
                'assets/images/screen_welcome.jpg',
                fit: BoxFit.cover,
                height: 200,
                width: 250,
              ).cornerRadiusWithClipRRect(20),
            ),
            Text('Your day will no longer \n be lonely',
                style: boldTextStyle(size: 25), textAlign: TextAlign.center),
            32.height,
            Text('Masuk untuk cari teman kencanmu!', style: primaryTextStyle()),
            32.height,
            Container(
              width: screenWidth,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Text('Belum Punya Akun?',
                  style: boldTextStyle(), textAlign: TextAlign.center),
            ).onTap(() {
              Get.to(() => KYCreateAccountScreen());
            },
                highlightColor: context.cardColor,
                splashColor: context.cardColor),
            8.height,
            AppButton(
              width: screenWidth,
              text: 'Mulai Sekarang',
              textStyle: boldTextStyle(color: white),
              // width: context.width(),
              shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: primaryColor,
              onTap: () {
                Get.off(() => KYSignScreen());
              },
            ).paddingOnly(left: 16, right: 16, bottom: 16),
          ],
        ),
      ),
    );
  }
}
