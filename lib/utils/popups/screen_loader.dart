import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendy_threads/utils/helpers/custom_helpers.dart';
import 'package:trendy_threads/widgets/Loaders/animation_loader.dart';

class ScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
          canPop: false, //Disable popping with back button
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color:
                CustomHelpers.isDark(Get.context!) ? Colors.grey : Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                AnimationLoader(text: text, animation: animation),
              ],
            ),
          )),
    );
  }

  static void closeLoadingDialog() {
    Navigator.of(Get.context!).pop(); 
  }
}
