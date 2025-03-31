part of 'view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              height: 180,
              color: Colors.greenAccent,
              child: Column(
                children: [
                  CustomAppBar(
                    padding: EdgeInsets.zero,
                    title: Text(
                      'Profile',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  CustomListTile(
                    onTap: () {
                      Get.to(
                        () => const EditProfilePage(),
                      );
                    },
                    imageUrl:
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    title: Text(
                      'Ali Afzal',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: Text(
                      'alijoyia000@gmail.com',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    trailing: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSizes.md,
            ),
            const _AccountSettingWidget(),
            const SizedBox(
              height: AppSizes.md,
            ),
            const _AppSettingsWidget(),
          ],
        ),
      ),
    );
  }
}

class _AccountSettingWidget extends StatelessWidget {
  const _AccountSettingWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Settings",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: AppSizes.md,
          ),
          CustomListTile(
            leading: const Icon(Icons.add_location),
            title: Text(
              'My Addresses',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'Set Shopping delivery address',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          // const Divider(),
          CustomListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text(
              'My Cart',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'Add, remove products and move to checkout',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          // const Divider(),
          CustomListTile(
            leading: const Icon(Icons.list_alt),
            title: Text(
              'My Orders',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'In Progress and completed orders',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          // const Divider(),
          CustomListTile(
            leading: const Icon(Icons.money),
            title: Text(
              'Bank Account',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'Withdraw balance to registered bank account',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          // const Divider(),
          CustomListTile(
            leading: const Icon(Icons.discount),
            title: Text(
              'My Coupans',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'List of all discounted coupans',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          CustomListTile(
            leading: const Icon(Icons.notifications),
            title: Text(
              'Notifications',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'Set any kind of notification message',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          CustomListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Account Privacy',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            subtitle: Text(
              'Manage data usage and connected accounts',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppSettingsWidget extends StatelessWidget {
  const _AppSettingsWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "App Settings",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: AppSizes.md,
            ),
            CustomListTile(
              leading: const Icon(Icons.data_exploration),
              title: Text(
                'Load Data',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                'Upload data to your cloud firestore',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            CustomListTile(
              leading: const Icon(Icons.location_pin),
              title: Text(
                'Geo-location',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                'Set recommendation based on location',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
            CustomListTile(
              leading: const Icon(Icons.safety_check),
              title: Text(
                'Safe Mode',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                'Search results are safe for all ages',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
            CustomListTile(
              leading: const Icon(Icons.image),
              title: Text(
                'HD Image Quality ',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                'Set Quality of images to be seen',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
            const SizedBox(
              height: AppSizes.lg,
            ),
            CustomElevatedButton.expanded(
              text: 'Log Out',
              onPressed: () {},
            ),
            const SizedBox(
              height: AppSizes.sm,
            ),
          ],
        ));
  }
}
