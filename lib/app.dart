import 'package:flutter/material.dart';
import 'package:trendy_threads/features/login/view/login_page.dart';
import 'package:trendy_threads/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: CustomAppTheme.darkTheme,
      theme: CustomAppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
