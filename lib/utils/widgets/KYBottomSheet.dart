import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:nb_utils/nb_utils.dart';

class DiscoverBottomSheetWidget extends StatefulWidget {
  @override
  DiscoverBottomSheetWidgetState createState() =>
      DiscoverBottomSheetWidgetState();
}

class DiscoverBottomSheetWidgetState extends State<DiscoverBottomSheetWidget> {
  final currentRangeValues = RangeValues(10, 90).obs;
  final values = RangeValues(1, 100).obs;
  final isActive = false.obs;

  final List<String> name = ['Male', 'Female'];
  final value = 0.obs;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.close).onTap(() {
                finish(context);
              }),
              Text('Filters', style: boldTextStyle()),
              Icon(Icons.check).onTap(() {
                finish(context);
              }),
            ],
          ),
          16.height,
          Text('Location', style: boldTextStyle()),
          16.height,
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: white),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                16.width,
                Text('Los Angeles, CA', style: primaryTextStyle()),
              ],
            ),
          ),
          16.height,
          Text('Location', style: boldTextStyle()),
          16.height,
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: white),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: name
                  .asMap()
                  .map(
                    (i, e) {
                      return MapEntry(
                        e,
                        Container(
                          height: 35,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: value.value == i ? deepSkyBlue : grey),
                            borderRadius: BorderRadius.circular(10),
                            color: value.value == i
                                ? deepSkyBlue
                                : context.cardColor,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            e,
                            style: secondaryTextStyle(
                                color: value.value == i ? white : grey),
                            textAlign: TextAlign.center,
                          ),
                        ).onTap(
                          () {
                            value.value = i;
                          },
                        ),
                      );
                    },
                  )
                  .values
                  .toList(),
            ),
          ),
          16.height,
          Text('Age', style: boldTextStyle()),
          16.height,
          Obx(() => RangeSlider(
                min: 1,
                max: 100,
                values: currentRangeValues.value,
                onChanged: (values) {
                  currentRangeValues.value = values;
                },
              )),
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
