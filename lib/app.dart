import 'package:flutter/material.dart';
import 'package:trendy_threads/features/router/router.dart';
import 'package:trendy_threads/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter().routeInformationParser,
      routeInformationProvider: AppRouter().routeInformationProvider,
      routerDelegate: AppRouter().routerDelegate,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: CustomAppTheme.darkTheme,
      theme: CustomAppTheme.lightTheme,
    );
  }
}
