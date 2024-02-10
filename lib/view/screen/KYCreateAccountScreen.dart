import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/utils/widgets/KYAccountWidget.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:kencanyuks/utils/widgets/KYWidgets.dart';
import 'package:kencanyuks/view/screen/KYInterestScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class KYCreateAccountScreen extends StatefulWidget {
  @override
  KYCreateAccountScreenState createState() => KYCreateAccountScreenState();
}

class KYCreateAccountScreenState extends State<KYCreateAccountScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  late Rx<DateTime> date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now().obs;
    dateController.text = DateFormat('dd/MM/yyyy').format(date.value);
  }

  pickDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: date.value,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (selectedDate != null) {
      date.value = selectedDate;
      dateController.text = DateFormat('dd/MM/yyyy').format(date.value);
    }
  }

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
              50.height,
              Text('Ayo Buat \nAkunmu', style: boldTextStyle(size: 30)),
              16.height,
              Text('Daftar agar pasanganmu lebih tahu kamu ya',
                  style: primaryTextStyle()),
              16.height,
              AppTextField(
                controller: emailController,
                textStyle: primaryTextStyle(),
                focus: emailFocus,
                textFieldType: TextFieldType.EMAIL,
                cursorColor: white,
                decoration: buildInputDecoration(
                  'Nama',
                  prefixIcon: Icon(Icons.person_outline, color: primaryColor),
                ),
              ),
              16.height,
              AppTextField(
                controller: dateController,
                textStyle: primaryTextStyle(),
                textFieldType: TextFieldType.OTHER,
                cursorColor: white,
                decoration: buildInputDecoration(
                  'Tanggal Lahir',
                  prefixIcon: Icon(Icons.date_range, color: primaryColor),
                ),
                onTap: () => pickDate(),
              ),
              16.height,
              AppTextField(
                textStyle: primaryTextStyle(),
                textFieldType: TextFieldType.OTHER,
                cursorColor: white,
                decoration: buildInputDecoration(
                  'Kota',
                  prefixIcon:
                      Icon(Icons.location_on_outlined, color: primaryColor),
                ),
              ),
              16.height,
              AccountWidget(),
              16.height,
              AppButton(
                text: 'Lanjutkan',
                textStyle: boldTextStyle(color: white),
                width: screenWidth,
                color: primaryColor,
                onTap: () {
                  Get.off(() => KYInterestScreen());
                },
              ),
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
