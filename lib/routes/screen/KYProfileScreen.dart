import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/main.dart';
import 'package:kencanyuks/model/KYKencanModel.dart';
import 'package:kencanyuks/utils/Data/KYGenerator.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:kencanyuks/utils/widgets/KYWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class KYProfileScreens extends GetxController {
  final List<KencanModel> list = getAllListData().obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    list.shuffle();
  }
}

class KYProfileScreen extends StatelessWidget {
  final KYProfileScreens controller = Get.put(KYProfileScreens());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(
          'Profile',
          center: true,
          color: context.cardColor,
          titleTextStyle: boldTextStyle(size: 25),
          showBack: false,
          actions: [
            Icon(Icons.settings, color: appStore.isDarkModeOn ? white : black)
                .paddingOnly(right: 16)
                .onTap(
              () {
                // DASettingScreen().launch(context);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  16.height,
                  commonCachedNetworkImage(
                    'https://i.pinimg.com/564x/f1/b4/88/f1b488d632aa647c6f6c75f2ae830f42.jpg',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                  ).cornerRadiusWithClipRRect(75),
                  16.height,
                  Text('Christian Yuda Pratama', style: boldTextStyle()),
                  8.height,
                  Text('Software Engineer', style: secondaryTextStyle()),
                  16.height,
                  AppButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.wifi_tethering_rounded, color: white),
                        Text(
                          'Upgrade your profile',
                          style: boldTextStyle(color: white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(),
                      ],
                    ),
                    width: width,
                    color: primaryColor,
                    // onTap: () {
                    //   DASettingScreen().launch(context);
                    // },
                  ),
                ],
              ),
              16.height,
              Text('Biography', style: boldTextStyle(size: 25)),
              16.height,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s.',
                style: secondaryTextStyle(),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gallery', style: boldTextStyle()),
                  Text('View All', style: primaryTextStyle(color: primaryColor))
                      .onTap(
                    () {
                      // DAProfileViewAllScreen().launch(context);
                    },
                  ),
                ],
              ),
              16.height,
              Obx(() {
                return Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  children: controller.list.take(12).map(
                    (e) {
                      return commonCachedNetworkImage(
                        e.image,
                        fit: BoxFit.cover,
                        height: 100,
                        width: (width / 3) - 22,
                      ).cornerRadiusWithClipRRect(10).onTap(() {
                        // DAZoomingScreen(img: e.image).launch(context);
                      }, highlightColor: white, splashColor: white);
                    },
                  ).toList(),
                );
              }),
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 16),
        ),
      ),
    );
  }
}
