import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trendy_threads/features/forget_password/forgot_password.dart';
import 'package:trendy_threads/features/login/login.dart';
import 'package:trendy_threads/features/onboarding/onboarding.dart';
import 'package:trendy_threads/features/shop/profile/view/edit_profile/edit_profile_page.dart';
import 'package:trendy_threads/features/sign_up/view/verify_email/success_screen.dart';
import 'package:trendy_threads/features/sign_up/view/view.dart';
import 'package:trendy_threads/features/tab/view/view.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = '/onboarding';
  // static const initial = '/';

  static List<GoRoute> routes = [
    // GoRoute(
    //     name: SplashPage.route(),
    //     path: SplashPage.route(),
    //     pageBuilder: (context, state) {
    //       return const MaterialPage(
    //         child: SplashPage(),
    //       );
    //     }),
    GoRoute(
        name: OnBoardingPage.route(),
        path: OnBoardingPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: OnBoardingPage(),
          );
        }),
    GoRoute(
        name: LoginPage.route(),
        path: LoginPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoginPage(),
          );
        }),
    GoRoute(
        name: SignUpPage.route(),
        path: SignUpPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignUpPage(),
          );
        }),
    GoRoute(
        name: ForgotPasswordPage.route(),
        path: ForgotPasswordPage.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ForgotPasswordPage(),
          );
        }),
    GoRoute(
        name: SuccessScreen.route(),
        path: SuccessScreen.route(),
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SuccessScreen(),
          );
        }),
    GoRoute(
        name: TabPage.route(),
        path: TabPage.route(),
        pageBuilder: (_, state) {
          return const MaterialPage(
            child: TabPage(),
          );
        }),
    GoRoute(
        name: EditProfilePage.route(),
        path: EditProfilePage.route(),
        pageBuilder: (_, state) {
          return const MaterialPage(
            child: EditProfilePage(),
          );
        }),
  ];
}
