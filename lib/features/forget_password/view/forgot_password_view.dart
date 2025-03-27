part of 'view.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forget Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Text(
                "Please Enter your email to recieive Password Reset Link",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwSection,
              ),
              const _EmailTextField(),
              Expanded(
                child: Container(),
              ),
              const _SubmitButton(),
            ],
          )),
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton.expanded(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SuccessScreen(
              title: 'Password Reset Email Sent',
              subtitle:
                  " We have sent you a secure Link to safely Change Your Password and keep Your Account Protected",
            ),
          ),
        );
      },
      text: 'Submit',
    );
  }
}
