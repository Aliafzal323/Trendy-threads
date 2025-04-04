import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendy_threads/utils/http/network_manager.dart';
import 'package:trendy_threads/utils/loaders/loaders.dart';

class SignUpController extends GetxController {
  //Get instance of SignUpController
  static SignUpController get instance => Get.find();

  final email = TextEditingController();

  final firstName = TextEditingController();

  final lastName = TextEditingController();

  final userName = TextEditingController();

  final phoneNumber = TextEditingController();

  final password = TextEditingController();

  final hidePassword = true.obs;

  RxBool privacyPolicy = true.obs;

  //Form key for validation
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      //Start LOading

      // ScreenLoader.openLoadingDialog(
      //     'We are processing you request', animation);

      //Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      //Form Validation
      if (!signUpFormKey.currentState!.validate()) {
        return;
      }

      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
            title: 'Privacy Policy',
            message: 'Please accept the privacy policy and terms of service');

        return;
      }

      //Register user in firebase auth and save data in firstore
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  bool showPassword() {
    return hidePassword.value = !hidePassword.value;
  }

  bool togglePolicy() {
    return privacyPolicy.value = !privacyPolicy.value;
  }
}
