import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trendy_threads/features/forget_password/forgot_password.dart';
import 'package:trendy_threads/features/login/login.dart';
import 'package:trendy_threads/features/onboarding/onboarding.dart';
import 'package:trendy_threads/features/sign_up/view/verify_email/success_screen.dart';
import 'package:trendy_threads/features/sign_up/view/view.dart';
import 'package:trendy_threads/features/splash/splash.dart';

class AppRoutes {
  AppRoutes._();

  static const onboarding = '/onboarding';
  static const initial = '/';

  static List<GoRoute> routes = [
    GoRoute(
        name: '/',
        path: SplashPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SplashPage(),
          );
        }),
    GoRoute(
        name: '/onboarding',
        path: OnBoardingPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: OnBoardingPage(),
          );
        }),
    GoRoute(
        name: '/login',
        path: LoginPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoginPage(),
          );
        }),
    GoRoute(
        name: '/signup',
        path: SignUpPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignUpPage(),
          );
        }),
    GoRoute(
        name: '/forgot_password',
        path: ForgotPasswordPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ForgotPasswordPage(),
          );
        }),
    GoRoute(
        name: '/success',
        path: SuccessScreen.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SuccessScreen(),
          );
        }),
  ];
}
