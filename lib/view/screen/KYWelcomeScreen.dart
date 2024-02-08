import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:nb_utils/nb_utils.dart';

class KYWelcomeScreen extends StatefulWidget {
  const KYWelcomeScreen({super.key});

  @override
  State<KYWelcomeScreen> createState() => _KYWelcomeScreenState();
}

class _KYWelcomeScreenState extends State<KYWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('apes', style: boldTextStyle(size: 35)).center().expand(),
            42.height,
            Text('No more lonely \n days!',
                style: boldTextStyle(size: 25), textAlign: TextAlign.center),
            16.height,
            Text('Sign in and find your couple now!',
                style: primaryTextStyle()),
            32.height,
            Container(
              // width: context.width(),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12, bottom: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Text('Do you already have an account?',
                  style: boldTextStyle(), textAlign: TextAlign.center),
            ).onTap(() {
              Get.to(() => DACreateAccountScreen());
            },
                highlightColor: context.cardColor,
                splashColor: context.cardColor),
            8.height,
            AppButton(
              text: 'Get Started',
              textStyle: boldTextStyle(color: white),
              // width: context.width(),
              color: primaryColor,
              onTap: () {
                Get.off(() => DASignInScreen());
              },
            ).paddingOnly(left: 16, right: 16, bottom: 16)
          ],
        ),
      ),
    );
  }
}

class DASignInScreen {}

class DACreateAccountScreen {}
