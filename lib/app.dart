import 'package:flutter/material.dart';
import 'package:trendy_threads/features/router/router.dart';
import 'package:trendy_threads/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter _router = AppRouter();
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: CustomAppTheme.darkTheme,
      theme: CustomAppTheme.lightTheme,
    );
  }
}
