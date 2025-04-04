import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loaders {
  static successSnackBar({required String title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      duration: Duration(seconds: duration),
      backgroundColor: Colors.green,
      margin: EdgeInsets.all(10),
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static warningSnackBar({required String title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      duration: Duration(seconds: duration),
      backgroundColor: Colors.orange,
      margin: EdgeInsets.all(20),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static errorSnackBar({
    required String title,
    message = '',
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red.shade600,
      margin: EdgeInsets.all(20),
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
