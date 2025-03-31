import 'package:flutter/material.dart';
import 'package:trendy_threads/utils/constants/sizes.dart';
import 'package:trendy_threads/widgets/app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSizes.md,
            ),
            const _ChangeProfilePIcture(),
            const SizedBox(
              height: AppSizes.md,
            ),
            const Divider(),
            const SizedBox(
              height: AppSizes.md,
            ),
            const _ProfileInformationWidget(),
            const SizedBox(
              height: AppSizes.md,
            ),
            const _PersonelInformationWidget(),
            TextButton(
              onPressed: () {},
              child: Text(
                'Delete Account',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileInformationWidget extends StatelessWidget {
  const _ProfileInformationWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personel Information',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        const _ProfileTile(
          title: 'Name',
          subtitle: 'Ali Afzal',
          icon: Icons.arrow_right_outlined,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        const _ProfileTile(
          title: 'Username',
          subtitle: 'Ali Afzal',
          icon: Icons.arrow_right_outlined,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        const Divider(),
      ],
    );
  }
}

class _ChangeProfilePIcture extends StatelessWidget {
  const _ChangeProfilePIcture();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Column(
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.md,
            ),
            Text(
              'Change Profile Picture',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Icon(
          icon,
          color: Colors.grey,
        )
      ],
    );
  }
}

class _PersonelInformationWidget extends StatelessWidget {
  const _PersonelInformationWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile Information',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        const _ProfileTile(
          title: 'User ID',
          subtitle: '123456',
          icon: Icons.arrow_right_outlined,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        const _ProfileTile(
          title: 'E-mail',
          subtitle: 'alijoyia000@gmail.com',
          icon: Icons.arrow_right_outlined,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        const _ProfileTile(
          title: 'Phone Number',
          subtitle: '0345-4242323',
          icon: Icons.arrow_right_outlined,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        const _ProfileTile(
          title: 'Gender',
          subtitle: 'Male',
          icon: Icons.arrow_right_outlined,
        ),
        const SizedBox(
          height: AppSizes.md,
        ),
        const _ProfileTile(
          title: 'Date Of Birth',
          subtitle: '10 Oct, 2002',
          icon: Icons.arrow_right_outlined,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        const Divider(),
        const SizedBox(
          height: AppSizes.sm,
        ),
      ],
    );
  }
}
