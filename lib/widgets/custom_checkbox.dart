import 'package:flutter/material.dart';

class CheckBoxWithText extends StatelessWidget {
  const CheckBoxWithText({
    super.key,
    required this.value,
    required this.onChanged,
    this.child,
    this.crossAxisAlignment,
  });
  final bool value;
  final void Function(bool?) onChanged;
  final Widget? child;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Checkbox(
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          value: value,
          onChanged: onChanged,
          // title:
        ),
        Expanded(
          child: child ??
              const Text(
                'Remember me',
              ),
        ),
      ],
    );
  }
}
