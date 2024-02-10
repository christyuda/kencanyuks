import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/model/KYKencanModel.dart';
import 'package:kencanyuks/routes/screen/KYHomeScreen.dart';
import 'package:kencanyuks/utils/Data/KYGenerator.dart';
import 'package:kencanyuks/utils/widgets/KYWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class KYLoveScreens extends GetxController {
  final List<KencanModel> list = getAllListData().obs;
  var isLoading = true.obs;
  var selectedKencan = KencanModel().obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    isLoading(true);
    list.addAll(getAllListData());
    list.shuffle();
    selectedKencan.value = list.isNotEmpty ? list.first : KencanModel();
    isLoading(false);
  }
}

class KYLoveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(
          'Love Screen',
          color: context.cardColor,
          center: true,
          titleTextStyle: boldTextStyle(size: 25),
          showBack: false,
        ),
        body: Obx(() {
          KencanModel selectedKencan =
              Get.find<HomeController>().selectedKencan.value;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectedKencan.image != null
                  ? commonCachedNetworkImage(
                      selectedKencan.image!,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ).cornerRadiusWithClipRRect(10)
                  : Placeholder(),
              16.height,
              Text(
                selectedKencan.name.validate(),
                style: boldTextStyle(size: 20),
              ),
              8.height,
              Text(
                selectedKencan.age.toString(),
                style: boldTextStyle(size: 18),
              ),
              8.height,
              Text(
                selectedKencan.education.validate(),
                style: boldTextStyle(size: 15),
              ),
            ],
          ).paddingAll(16);
        }),
      ),
    );
  }
}
