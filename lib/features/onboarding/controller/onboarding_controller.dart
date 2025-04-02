import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendy_threads/features/login/view/view.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final PageController pageController = PageController();

  Rx<int> currentIndex = 0.obs;

  void updatePageIndicator(index) => currentIndex.value = index;

  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(
          milliseconds: 300,
        ),
        curve: Curves.easeInCubic);
  }

  void skipPage() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInCubic,
    );
  }

  void nextPage(BuildContext context) {
    if (currentIndex.value < 2) {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInCubic,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }
}
