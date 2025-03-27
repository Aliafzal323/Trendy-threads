import 'package:flutter/material.dart';
import 'package:trendy_threads/features/login/view/login_view.dart';
import 'package:trendy_threads/features/sign_up/view/verify_email/verify_email_page.dart';
import 'package:trendy_threads/utils/constants/asset_icons.dart';
import 'package:trendy_threads/utils/constants/sizes.dart';
import 'package:trendy_threads/widgets/custom_checkbox.dart';
import 'package:trendy_threads/widgets/custom_elevated_button.dart';
import 'package:trendy_threads/widgets/or_with_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let’s Create your Account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSection,
              ),
              const Row(
                children: [
                  Expanded(child: _FirstNameTextField()),
                  SizedBox(
                    width: AppSizes.spaceBtwInputFields,
                  ),
                  Expanded(child: _LastNameTextField()),
                ],
              ),
              const SizedBox(
                height: AppSizes.md,
              ),
              const _EmailTextField(),
              const SizedBox(
                height: AppSizes.md,
              ),
              const _PhoneTextField(),
              const SizedBox(
                height: AppSizes.md,
              ),
              const _PasswordTextField(),
              const SizedBox(
                height: AppSizes.md,
              ),
              const _TermsAndPolicyWidget(),
              const SizedBox(
                height: AppSizes.lg,
              ),
              const _CreateAccountButton(),
              const SizedBox(
                height: AppSizes.lg,
              ),
              const ORWithWidget(dividerText: 'Or Sign up with'),
              const SizedBox(
                height: AppSizes.lg,
              ),
              const _SocialSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TermsAndPolicyWidget extends StatelessWidget {
  const _TermsAndPolicyWidget();

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return CheckBoxWithText(
      value: true,
      onChanged: (value) {},
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodySmall,
          text: 'I agree to the ',
          children: [
            TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: dark ? Colors.white : Colors.green)
                  .apply(decoration: TextDecoration.underline),
              text: 'Privacy Policy ',
            ),
            TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              text: 'And ',
            ),
            TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: dark ? Colors.white : Colors.green)
                  .apply(
                    decoration: TextDecoration.underline,
                  ),
              text: 'Terms of use',
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialSignUp extends StatelessWidget {
  const _SocialSignUp();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _GoogleSignUpButton(),
        SizedBox(width: AppSizes.spaceBtwItems),
        _FacbookSignUpButton(),
      ],
    );
  }
}

class _FacbookSignUpButton extends StatelessWidget {
  const _FacbookSignUpButton();

  @override
  Widget build(BuildContext context) {
    return CustomCircularContainer(
      icon: AssetIcons.facebook_icon,
      onTap: () {},
    );
  }
}

class _GoogleSignUpButton extends StatelessWidget {
  const _GoogleSignUpButton();

  @override
  Widget build(BuildContext context) {
    return CustomCircularContainer(
      icon: AssetIcons.google_icon,
      onTap: () {},
    );
  }
}

class _FirstNameTextField extends StatelessWidget {
  const _FirstNameTextField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'First Name',
      ),
    );
  }
}

class _LastNameTextField extends StatelessWidget {
  const _LastNameTextField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Last Name',
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton.expanded(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const VerifyEmailPage()));
      },
      text: 'Create Account',
    );
  }
}

class _PhoneTextField extends StatelessWidget {
  const _PhoneTextField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.phone),
        labelText: 'Phone Number',
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Email',
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.password),
        labelText: 'Password',
        suffixIcon: Icon(
          Icons.remove_red_eye,
        ),
      ),
    );
  }
}
