import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BadgeAnimationWidget extends StatelessWidget {
  const BadgeAnimationWidget({
    super.key,
    this.count,
    this.icon,
    this.onTap,
  });
  final String? count;
  final Icon? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -12, end: 0),
      showBadge: true,
      ignorePointer: false,
      onTap: onTap,
      badgeContent: Text(
        count ?? '2',
        style: const TextStyle(color: Colors.white),
      ),
      badgeAnimation: const badges.BadgeAnimation.slide(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.elasticInOut,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        badgeColor: Colors.black,
        padding: const EdgeInsets.all(5),
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.white, width: 2),
        elevation: 0,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: icon ?? const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}
