import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trendy_threads/utils/constants/sizes.dart';
import 'package:trendy_threads/widgets/custom_elevated_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key, this.title, this.subtitle});
  final String? title;
  final String? subtitle;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // animationController.addStatusListener((status) async {
    //   if (status == AnimationStatus.completed) {
    //     Navigator.pop(context);
    //     animationController.reset();
    //   }
    // });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          children: [
            Lottie.asset(
              'assets/animations/success.json',
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.width * 0.75,
              repeat: false,
              controller: animationController,
              onLoaded: (compositon) {
                animationController.forward();
              },
            ),
            const SizedBox(
              height: AppSizes.md,
            ),
            Text(
              widget.title ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Text(
              widget.subtitle ?? '',
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(),
            ),
            const _DoneButtom(),
          ],
        ),
      ),
    );
  }
}

class _DoneButtom extends StatelessWidget {
  const _DoneButtom();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton.expanded(
      onPressed: () {
        // Todo -- Navigation Needs to be Implemented
      },
      text: 'Submit',
    );
  }
}
