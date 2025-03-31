import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trendy_threads/features/onboarding/controller/onboarding_controller.dart';
import 'package:trendy_threads/utils/constants/sizes.dart';
import 'package:trendy_threads/utils/helpers/custom_helpers.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingWidget(
                image: 'assets/images/splash_image.png',
                title: 'Choose Your Product',
                description:
                    'Welcome to a world of limitless choices - Your Perfect Product Awaits!',
              ),
              OnBoardingWidget(
                image: 'assets/images/splash_image.png',
                title: 'Choose Your Product',
                description:
                    'Welcome to a world of limitless choices - Your Perfect Product Awaits!',
              ),
              OnBoardingWidget(
                image: 'assets/images/splash_image.png',
                title: 'Choose Your Product',
                description:
                    'Welcome to a world of limitless choices - Your Perfect Product Awaits!',
              )
            ],
          ),
          const _OnboardingForwardButton(),
          const _OnBoardingSkipButton(),
          const _NavigationDots()
        ],
      ),
    );
  }
}

class _NavigationDots extends StatelessWidget {
  const _NavigationDots();

  @override
  Widget build(BuildContext context) {
    final isDark = CustomHelpers.isDark(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: AppSizes.xl,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: isDark ? Colors.grey : Colors.green,
          dotHeight: 6,
        ),
        controller: controller.pageController,
        count: 3,
      ),
    );
  }
}

class _OnboardingForwardButton extends StatelessWidget {
  const _OnboardingForwardButton();

  @override
  Widget build(BuildContext context) {
    final isDark = CustomHelpers.isDark(context);
    return Positioned(
      bottom: AppSizes.sm,
      right: AppSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark
              ? Colors.grey.withOpacity(0.8)
              : Colors.green.withOpacity(0.6),
          shape: const CircleBorder(),
        ),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class _OnBoardingSkipButton extends StatelessWidget {
  const _OnBoardingSkipButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSizes.appbarHeight,
      right: AppSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          OnBoardingController.instance.skipPage();
        },
        child: const Text('Skip'),
      ),
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.5,
          image,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItems,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black.withOpacity(0.5),
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
