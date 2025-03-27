import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trendy_threads/features/sign_up/view/verify_email/success_screen.dart';
import 'package:trendy_threads/utils/constants/sizes.dart';
import 'package:trendy_threads/widgets/custom_elevated_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/animations/sent_email.json',
                    width: MediaQuery.of(context).size.width * 0.65,
                  ),
                  Text(
                    "Verify your email address!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Text(
                    "alijoyia000@gmail.com",
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Text(
                    "Congratulations! Your Account Created: Verify your Email Address to Start Shopping...",
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const _ContinueButton(),
            const _ResendButton(),
          ],
        ),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton.expanded(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SuccessScreen(
              title: 'Your Account Successfully Created!',
              subtitle:
                  " Welcome to your Ultimate Shopping Destination.Your Account is Created, Continue Shopping ...",
            ),
          ),
        );
      },
      text: 'Verify Email',
    );
  }
}

class _ResendButton extends StatelessWidget {
  const _ResendButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text('Resend Email'),
    );
  }
}
