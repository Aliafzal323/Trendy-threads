import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    this.leading,
    this.trailing,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.padding,
    this.enabled = true,
    this.loading = false,
    this.isTransparent = false,
    this.onPressed,
    this.disabledForegroundColor,
    this.disabledBackgroundColor,
    this.borderColor,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
  });
  const CustomOutlinedButton.expanded({
    super.key,
    required this.text,
    this.leading,
    this.trailing,
    this.height,
    this.borderRadius = 8.0,
    this.padding,
    this.enabled = true,
    this.loading = false,
    this.onPressed,
    this.isTransparent = false,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderColor,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
  }) : width = double.infinity;
  final String? text;
  final TextStyle? textStyle;
  final Widget? leading;
  final Widget? trailing;
  final double? height;
  final double? width;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final bool loading;
  final VoidCallback? onPressed;
  final bool isTransparent;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: loading
            ? () {}
            : enabled
                ? onPressed
                : null,
        // style: ElevatedButton.styleFrom(
        //   padding: padding ??
        //       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        //   shape: RoundedRectangleBorder(
        //     side: BorderSide(
        //       color: borderColor ?? Colors.green,
        //       width: enabled ? 1 : 0,
        //     ),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(borderRadius),
        //     ),
        //   ),
        //   elevation: 0,
        //   backgroundColor:
        //       backgroundColor ?? (isTransparent ? Colors.white : Colors.green),
        //   foregroundColor: foregroundColor ??
        //       (isTransparent ? context.primary500 : context.white),
        //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //   textStyle: textStyle ?? context.sixteen500,
        //   disabledBackgroundColor: disabledBackgroundColor ?? context.success50,
        //   disabledForegroundColor:
        //       disabledForegroundColor ?? context.primary500,
        // ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 8.0),
            ],
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: loading
                    ? const CircularProgressIndicator()
                    : Text(text ?? 'Continue'),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 8.0),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
