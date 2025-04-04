part of 'view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Form(
            key: controller.signUpFormKey,
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
                Row(
                  children: [
                    Expanded(
                        child: _FirstNameTextField(controller: controller)),
                    const SizedBox(
                      width: AppSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: _LastNameTextField(
                      controller: controller,
                    )),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.md,
                ),
                _EmailTextField(controller),
                const SizedBox(
                  height: AppSizes.md,
                ),
                _PhoneTextField(controller),
                const SizedBox(
                  height: AppSizes.md,
                ),
                _PasswordTextField(controller),
                const SizedBox(
                  height: AppSizes.md,
                ),
                _TermsAndPolicyWidget(
                  signUpController: controller,
                ),
                const SizedBox(
                  height: AppSizes.lg,
                ),
                _CreateAccountButton(controller),
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
      ),
    );
  }
}

class _TermsAndPolicyWidget extends StatelessWidget {
  const _TermsAndPolicyWidget({
    required this.signUpController,
  });
  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelpers.isDark(context);
    return Obx(
      () => CheckBoxWithText(
        value: signUpController.privacyPolicy.value,
        onChanged: (value) {
          signUpController.togglePolicy();
        },
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
  const _FirstNameTextField({
    required this.controller,
  });
  final SignUpController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return Validation.validateEmptyText(
          'First Name',
          value,
        );
      },
      controller: controller.firstName,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'First Name',
      ),
    );
  }
}

class _LastNameTextField extends StatelessWidget {
  const _LastNameTextField({
    required this.controller,
  });
  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.lastName,
      validator: (value) {
        return Validation.validateEmptyText(
          'Last Name',
          value,
        );
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: 'Last Name',
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton(this.signUpController);
  final SignUpController signUpController;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton.expanded(
      onPressed: () {
        signUpController.signUp();
        // context.push(VerifyEmailPage.route());
      },
      text: 'Create Account',
    );
  }
}

class _PhoneTextField extends StatelessWidget {
  const _PhoneTextField(this.controller);
  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return Validation.validatePhoneNumber(
          value,
        );
      },
      controller: controller.phoneNumber,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.phone),
        labelText: 'Phone Number',
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField(this.controller);

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.email,
      validator: (value) {
        return Validation.validateEmail(
          value,
        );
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        labelText: 'Email',
      ),
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField(this.controller);

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        validator: (value) {
          return Validation.validatePassword(
            value,
          );
        },
        controller: controller.password,
        obscureText: controller.hidePassword.value,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.password),
          labelText: 'Password',
          suffixIcon: GestureDetector(
            onTap: () {
              controller.showPassword();
            },
            child: controller.hidePassword.value
                ? const Icon(
                    Icons.visibility_off,
                  )
                : const Icon(Icons.visibility),
          ),
        ),
      ),
    );
  }
}
