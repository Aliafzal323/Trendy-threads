import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      this.imageUrl,
      this.title,
      this.subtitle,
      this.trailing,
      this.isTrailing = true,
      this.onTap,
      this.leading});
  final String? imageUrl;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool isTrailing;
  final VoidCallback? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: leading ??
            CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl ??
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
            ),
        title: title,
        subtitle: subtitle,
        trailing: isTrailing ? trailing : null,
      ),
    );
  }
}
