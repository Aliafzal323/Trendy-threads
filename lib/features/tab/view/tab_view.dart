part of 'view.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BodyView();
  }
}

class _BodyView extends StatelessWidget {
  const _BodyView();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: _BottomNavBar(
        controller: controller,
      ),
      body: Obx(
        () => controller.containers[controller.navigationIndex.value],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.controller});
  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    final isDark = CustomHelpers.isDark(context);
    return Obx(
      () => NavigationBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
        selectedIndex: controller.navigationIndex.value,
        elevation: 11,
        shadowColor: Colors.black,
        indicatorColor: Colors.transparent,
        destinations: TabItem.items
            .map((e) => _buildItemView(
                  tab: e,
                  controller: controller,
                ))
            .toList(),
        height: 56,
        onDestinationSelected: (index) {
          controller.navigationIndex.value = index;
        },
      ),
    );
  }

  Widget _buildItemView({
    required TabItem tab,
    required NavigationController controller,
  }) =>
      _TabItemView(
        tab,
        selected:
            TabItem.items.indexOf(tab) == controller.navigationIndex.value,
        onTap: () {
          controller.navigationIndex.value = TabItem.items.indexOf(tab);
        },
      );
}

class _TabItemView extends StatelessWidget {
  const _TabItemView(
    this.tab, {
    this.selected = false,
    this.onTap,
  });

  final TabItem tab;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = CustomHelpers.isDark(context);
    Color iconColor =
        selected ? (isDark ? Colors.white : Colors.green) : Colors.grey;
    Color textColor =
        selected ? (isDark ? Colors.white : Colors.green) : Colors.grey;
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              tab.icon,
              color: iconColor,
            ),
            Text(
              tab.title,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
