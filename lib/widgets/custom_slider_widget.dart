import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendy_threads/features/shop/home/controllers/home_controller.dart';
import 'package:trendy_threads/features/shop/home/view/view.dart';
import 'package:trendy_threads/utils/constants/sizes.dart';
import 'package:trendy_threads/widgets/rounded_image.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: const [
            RoundedImageWidget(
              padding: EdgeInsets.symmetric(horizontal: 16),
              imageUrl: 'assets/images/banner_image1.png',
              applyImageRadius: true,
            ),
            RoundedImageWidget(
              applyImageRadius: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              imageUrl: 'assets/images/banner_image1.png',
            ),
            RoundedImageWidget(
              applyImageRadius: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              imageUrl: 'assets/images/banner_image1.png',
            ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) {
              controller.setCurrentIndex(index);
            },
          ),
        ),
        const SizedBox(
          height: AppSizes.lg,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                CustomCircleContainer(
                  margin: const EdgeInsets.only(right: 10),
                  height: 4,
                  width: 16,
                  backgroundColor: controller.currentIndex.value == i
                      ? Colors.green
                      : Colors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}
