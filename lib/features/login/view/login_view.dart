part of 'view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.appbarHeight,
            left: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace,
            bottom: AppSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopHeaderSection(),
              const SizedBox(
                height: AppSizes.sm,
              ),
              const EmailTextField(),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),
              const _PasswordTextField(),
              const SizedBox(
                height: AppSizes.xs,
              ),
              const _RemeberAndForgotWidget(),
              const SizedBox(
                height: AppSizes.spaceBtwInputFields,
              ),
              const _SignInButton(),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              const _CreateAccountButton(),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              const ORWithWidget(
                dividerText: 'Or Sign In With',
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCircularContainer(
                    icon: AssetIcons.google_icon,
                    onTap: () {},
                  ),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  CustomCircularContainer(
                    icon: AssetIcons.facebook_icon,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final AssetIcons icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(80),
        ),
        child: AssetIcon.multicolor(icon),
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton();

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton.expanded(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SignUpPage(),
          ),
        );
      },
      text: 'Create Account',
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton.expanded(
      onPressed: () {
        Get.to(
          () => const TabPage(),
        );
      },
      text: 'Sign In',
    );
  }
}

class _RemeberAndForgotWidget extends StatelessWidget {
  const _RemeberAndForgotWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(
              width: AppSizes.xs,
            ),
            const Text('Remember me'),
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ForgotPasswordPage(),
              ),
            );
          },
          child: const Text('Forgot Password?'),
        ),
      ],
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
          suffixIcon: Icon(Icons.remove_red_eye)),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

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

class _TopHeaderSection extends StatelessWidget {
  const _TopHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          fit: BoxFit.cover,
          'assets/images/splash_image.png',
          cacheHeight: 180,
          cacheWidth: 200,
        ),
        Text(
          'Welcome, Trendy Threads',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        Text(
          'Discovered Limitless Choices and unmatched Quality.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
      ],
    );
  }
}
