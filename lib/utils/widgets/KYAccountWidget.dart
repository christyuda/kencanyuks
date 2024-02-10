import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:nb_utils/nb_utils.dart';

class AccountController extends GetxController {
  var isExpanded = false.obs;
  var selectedIndex = 0.obs;

  final List<String> genders = ['Laki - Laki', 'Perempuan'];

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  void selectGender(int index) {
    selectedIndex.value = index;
  }
}

class AccountWidget extends StatelessWidget {
  final AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ExpansionPanelList(
        animationDuration: Duration(seconds: 1),
        expansionCallback: (int index, bool isExpanded) {
          accountController.toggleExpansion();
        },
        children: [
          ExpansionPanel(
            headerBuilder: (_, bool isExpanded) {
              return Row(
                children: [
                  8.width,
                  Icon(Icons.mouse_outlined, color: primaryColor),
                  12.width,
                  Text('Jenis Kelamin', style: primaryTextStyle()),
                ],
              );
            },
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: accountController.genders
                  .asMap()
                  .map(
                    (index, gender) => MapEntry(
                      index,
                      GestureDetector(
                        onTap: () {
                          accountController.selectGender(index);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                accountController.selectedIndex.value == index
                                    ? deepSkyBlue
                                    : context.cardColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: accountController.selectedIndex.value ==
                                        index
                                    ? white
                                    : grey),
                          ),
                          child: Text(gender,
                              style: primaryTextStyle(
                                  color:
                                      accountController.selectedIndex.value ==
                                              index
                                          ? white
                                          : grey)),
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
            isExpanded: accountController.isExpanded.value,
          )
        ],
      ),
    );
  }
}
