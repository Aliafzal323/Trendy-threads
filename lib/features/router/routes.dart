import 'package:go_router/go_router.dart';
import 'package:trendy_threads/features/forget_password/forgot_password.dart';
import 'package:trendy_threads/features/login/login.dart';
import 'package:trendy_threads/features/onboarding/onboarding.dart';
import 'package:trendy_threads/features/shop/home/view/view.dart';
import 'package:trendy_threads/features/shop/profile/view/edit_profile/edit_profile_page.dart';
import 'package:trendy_threads/features/sign_up/view/verify_email/success_screen.dart';
import 'package:trendy_threads/features/sign_up/view/verify_email/verify_email_page.dart';
import 'package:trendy_threads/features/sign_up/view/view.dart';
import 'package:trendy_threads/features/tab/view/view.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = '/onboarding';

  static List<GoRoute> routes = [
    GoRoute(
      name: OnBoardingPage.route(),
      path: OnBoardingPage.route(),
      builder: (_, __) => const OnBoardingPage(),
    ),
    GoRoute(
      name: LoginPage.route(),
      path: LoginPage.route(),
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      name: VerifyEmailPage.route(),
      path: VerifyEmailPage.route(),
      builder: (context, state) => const VerifyEmailPage(),
    ),
    GoRoute(
      name: SignUpPage.route(),
      path: SignUpPage.route(),
      builder: (_, __) => const SignUpPage(),
    ),
    GoRoute(
      name: ForgotPasswordPage.route(),
      path: ForgotPasswordPage.route(),
      builder: (_, __) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: SuccessScreen.route(),
      builder: (context, state) {
        final params = state.extra as Map<String, String>;
        return SuccessScreen(
          title: params['title']!,
          subtitle: params['subtitle']!,
        );
      },
    ),
    GoRoute(
      name: TabPage.route(),
      path: '/tab',
      builder: (_, __) => const TabPage(),
    ),
    GoRoute(
      name: EditProfilePage.route(),
      path: EditProfilePage.route(),
      builder: (context, state) => const EditProfilePage(),
    ),
    GoRoute(
      name: HomePage.route(),
      path: '/home',
      builder: (_, __) {
        return const HomePage();
      },
    ),
  ];
}
