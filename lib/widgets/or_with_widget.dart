import 'package:flutter/material.dart';

class ORWithWidget extends StatelessWidget {
  const ORWithWidget({super.key, required this.dividerText});
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: Divider(
              color: Colors.grey, thickness: 0.5, indent: 5, endIndent: 10),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Flexible(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 10,
          ),
        ),
      ],
    );
  }
}
