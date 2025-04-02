part of 'view.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key});

  static String route() => '/tab';

  @override
  Widget build(BuildContext context) {
    return const TabScreen();
  }
}
