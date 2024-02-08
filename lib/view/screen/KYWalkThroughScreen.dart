import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:kencanyuks/utils/widgets/KYWidgets.dart';
import 'package:kencanyuks/view/screen/KYWelcomeScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class KYWalkThroughScreen extends StatefulWidget {
  const KYWalkThroughScreen({super.key});

  @override
  KYWalkThroughScreenState createState() => KYWalkThroughScreenState();
}

class KYWalkThroughScreenState extends State<KYWalkThroughScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<WalkThroughModelClass> list = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    list.add(
      WalkThroughModelClass(
          title: 'Get coupled!',
          image:
              'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.5.jpg'),
    );
    list.add(
      WalkThroughModelClass(
          title: 'Meet new people!',
          image:
              'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.9.jpg'),
    );
    list.add(
      WalkThroughModelClass(
          title: 'No more lonely days!',
          image:
              'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.7.jpg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: list.map((e) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonCachedNetworkImage(
                    e.image,
                    fit: BoxFit.cover,
                    height: 450,
                    width: 250,
                  ).cornerRadiusWithClipRRect(20),
                  22.height,
                  Text(e.title!,
                      style: boldTextStyle(size: 22),
                      textAlign: TextAlign.center),
                  8.height,
                  Text(
                    'Lorem ipsum dolor sit amet, \n consectetur adipiscing elit.',
                    style: secondaryTextStyle(size: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }).toList(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: DotIndicator(
              indicatorColor: primaryColor,
              pageController: pageController,
              pages: list,
              unselectedIndicatorColor: grey,
              onPageChanged: (index) {
                currentPage = index;
              },
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(12),
                  text: 'Skip',
                  color: context.cardColor,
                  textStyle: primaryTextStyle(),
                  onTap: () {
                    Get.off(() => const KYWelcomeScreen());
                  },
                ).visible(currentPage != 2),
                16.width,
                AppButton(
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(12),
                  color: primaryColor,
                  text: currentPage != 2 ? 'Next' : 'Create an account',
                  textStyle: primaryTextStyle(color: white),
                  onTap: () {
                    if (currentPage == 2) {
                      Get.off(() => const KYWelcomeScreen());
                    } else {
                      pageController.animateToPage(
                        currentPage + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }
                  },
                ).expand()
              ],
            ).paddingOnly(left: 16, right: 16),
          ),
        ],
      ),
    );
  }
}
