import 'package:flutter/material.dart';
import 'package:trendy_threads/utils/constants/sizes.dart';
import 'package:trendy_threads/utils/helpers/custom_helpers.dart';

class VerticalImageTextWidget extends StatelessWidget {
  const VerticalImageTextWidget({
    super.key,
    this.onTap,
    this.backgroundColor,
    this.textStyle,
    this.title,
    this.icon,
  });

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final isDark = CustomHelpers.isDark(context);
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.spaceBtwInputFields),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (isDark ? Colors.black : Colors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              height: 56,
              width: 56,
              child: Center(
                  child: Icon(
                icon,
                color: isDark ? Colors.white : Colors.black,
              )),
            ),
            const SizedBox(
              height: AppSizes.xs,
            ),
            Text(
              title ?? '',
              overflow: TextOverflow.ellipsis,
              style: textStyle ??
                  Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
