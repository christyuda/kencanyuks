import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kencanyuks/services/FirebaseService.dart';
import 'package:kencanyuks/utils/widgets/KYColors.dart';
import 'package:kencanyuks/utils/widgets/KYWidgets.dart';
import 'package:kencanyuks/view/screen/KYCreateAccountScreen.dart';
import 'package:kencanyuks/view/screen/KYWelcomeScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class KYSignScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passWordFocus = FocusNode();

  KYSignScreen({super.key});
  Map<String, String> dummyUserData = {
    'email': 'dummy@example.com',
    'password': 'dummy123',
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kencan Yuk', style: boldTextStyle(size: 25)),
          backgroundColor: context.cardColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(() => KYWelcomeScreen());
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.height,
              Text('Welcome back!', style: boldTextStyle(size: 30)),
              16.height,
              Text('Senang Kamu Datang Kembali Sayang!',
                  style: primaryTextStyle()),
              16.height,
              AppTextField(
                controller: emailController,
                textStyle: primaryTextStyle(),
                focus: emailFocus,
                nextFocus: passWordFocus,
                textFieldType: TextFieldType.EMAIL,
                cursorColor: white,
                decoration: buildInputDecoration('Email',
                    prefixIcon:
                        const Icon(Icons.email_outlined, color: primaryColor)),
              ),
              16.height,
              AppTextField(
                focus: passWordFocus,
                controller: passController,
                textStyle: primaryTextStyle(),
                textFieldType: TextFieldType.PASSWORD,
                cursorColor: white,
                decoration: buildInputDecoration('Password',
                    prefixIcon:
                        const Icon(Icons.lock_open, color: primaryColor)),
              ),
              16.height,
              ElevatedButton(
                onPressed: () {
                  if (emailController.text == dummyUserData['email'] &&
                      passController.text == dummyUserData['password']) {
                    Get.snackbar('Success', 'Berhasil login');
                    Get.off(() => KYCreateAccountScreen());
                  } else {
                    // Autentikasi gagal, tampilkan snackbar
                    Get.snackbar('Error', 'Email atau password salah');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: Size(screenWidth, 50),
                ),
                child: Text('Sign In', style: boldTextStyle(color: white)),
              ),
              16.height,
              ElevatedButton(
                onPressed: () async {
                  Get.put(FirebaseService());

                  try {
                    await _firebaseService.signInWithGoogle();
                    Get.off(() => KYCreateAccountScreen());
                  } catch (e) {
                    Get.snackbar('Error', 'Gagal login dengan Google');
                    print('Error signing in with Google: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black),
                  ),
                  minimumSize: Size(screenWidth, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google.png',
                        height: 20, width: 20),
                    SizedBox(width: 8),
                    Text('Login dengan Google',
                        style: boldTextStyle(color: Colors.black)),
                  ],
                ),
              ).paddingOnly(left: 0, right: 0, bottom: 25),
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
