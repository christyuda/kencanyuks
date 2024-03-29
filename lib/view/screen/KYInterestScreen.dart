import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/main.dart';
import 'package:kencanyuks/model/KYKencanModel.dart';
import 'package:kencanyuks/utils/Data/KYGenerator.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:kencanyuks/view/screen/KYDashboardScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class KYInterestScreen extends StatelessWidget {
  final List<KencanModel> list = getInterests().obs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget('Kencan Yuk',
            showBack: false,
            titleTextStyle: boldTextStyle(size: 25),
            color: context.cardColor),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Kira Kira \nApa ya Kesukaanmu?',
                  style: boldTextStyle(size: 28)),
              16.height,
              Text('Pilih apa yang kamu suka', style: primaryTextStyle()),
              16.height,
              Obx(() => Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 4,
                    children: list.map((i) {
                      return Container(
                        width: screenWidth * 0.46 - 24,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: i.mISCheck!
                                  ? primaryColor
                                  : appStore.isDarkModeOn
                                      ? cardLightColor
                                      : white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: i.mISCheck!
                                ? white
                                : appStore.isDarkModeOn
                                    ? white
                                    : blueViolet),
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Text(i.name.validate(),
                            style: boldTextStyle(
                                color: i.mISCheck!
                                    ? primaryColor
                                    : appStore.isDarkModeOn
                                        ? cardLightColor
                                        : white),
                            //
                            textAlign: TextAlign.center),
                      ).onTap(() {
                        i.mISCheck = !i.mISCheck!;
                      }, splashColor: white, highlightColor: primaryColor);
                    }).toList(),
                  )),
              16.height,
              AppButton(
                width: screenWidth,
                color: primaryColor,
                onTap: () {
                  finish(context);
                  KYDashboardScreen().launch(context);
                  // Get.to(() => KYDashboardScreen());
                },
                text: 'Continue',
                textStyle: boldTextStyle(color: white),
              ),
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 32),
        ),
      ),
    );
  }
}
