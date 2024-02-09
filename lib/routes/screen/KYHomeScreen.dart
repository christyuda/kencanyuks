import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kencanyuks/model/KYKencanModel.dart';
import 'package:kencanyuks/utils/Data/KYGenerator.dart';
import 'package:kencanyuks/utils/widgets/KYBottomSheet.dart';
import 'package:kencanyuks/utils/widgets/KYWidgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:get/get.dart';

class KYHomeScreen extends StatelessWidget {
  final List<KencanModel> list = getAllListData();
  final SwiperController controller = SwiperController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBarWidget(
        'Discover',
        color: context.cardColor,
        center: true,
        titleTextStyle: boldTextStyle(size: 25),
        showBack: false,
        actions: [
          Icon(Icons.sort, color: white).paddingOnly(right: 16).onTap(
            () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return DiscoverBottomSheetWidget();
                },
              );
            },
          ),
        ],
      ),
      body: GetBuilder<DAHomeFragmentController>(
        init: DAHomeFragmentController(),
        builder: (controller) {
          return Swiper(
            controller: this.controller,
            itemHeight: screenHeight * 0.7,
            itemCount: list.length,
            itemWidth: screenWidth * 0.8,
            layout: SwiperLayout.STACK,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    height: screenHeight * 0.7,
                    width: screenWidth * 0.8,
                    child: commonCachedNetworkImage(
                      list[index].image!.validate(),
                      fit: BoxFit.cover,
                    ).cornerRadiusWithClipRRect(10).onTap(
                      () {
                        // DAZoomingScreen(img: list[index].image).launch(context);
                      },
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.7,
                    width: screenWidth * 0.8,
                    decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: Colors.black26),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.width,
                        Row(
                          children: [
                            Text('${list[index].name!.validate()},',
                                style: boldTextStyle(
                                    color: lightYellow, size: 20)),
                            8.width,
                            Text(list[index].age.toString().validate(),
                                style: boldTextStyle(
                                    color: lightYellow, size: 18)),
                          ],
                        ),
                        Text(list[index].education!.validate(),
                            style: boldTextStyle(color: khaki, size: 15)),
                        8.height,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 4),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: redColor.withOpacity(0.7),
                                  shape: BoxShape.circle),
                              child: Icon(Icons.clear, color: white, size: 30),
                            ).onTap(
                              () {
                                this.controller.next(animation: true);
                              },
                            ),
                            16.width,
                            Container(
                              margin: EdgeInsets.only(bottom: 4),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: greenColor.withOpacity(0.7),
                                  shape: BoxShape.circle),
                              child: Icon(Icons.check, color: white, size: 30),
                            ).onTap(
                              () {
                                this.controller.next(animation: true);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).paddingOnly(left: 16, bottom: 24),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class DAHomeFragmentController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Initialize any variables or fetch data here
  }

  @override
  void onClose() {
    // Clean up any resources when the controller is disposed
    super.onClose();
  }
}
