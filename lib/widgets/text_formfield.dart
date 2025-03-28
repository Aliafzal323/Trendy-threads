import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.isRequired = false,
    this.hasError = false,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autocorrect = false,
    this.keyboardType,
    this.helperText,
    this.hintText,
    this.errorText,
    this.errorStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
    this.contentPadding,
    this.borderRadius,
    this.borderSide,
    this.focusedBorder,
    this.hintTextStyle,
    this.textInputAction,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String? labelText;
  final bool? isRequired;
  final bool hasError;
  final bool readOnly;
  final bool enabled;
  final bool autocorrect;
  final bool obscureText;
  final int maxLines;
  final String? helperText;
  final String? errorText;
  final TextStyle? errorStyle;

  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final InputBorder? focusedBorder;
  final TextStyle? hintTextStyle;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  bool get _showErrorText => hasError && (errorText != null);

  bool get _showHintText => !_showErrorText && (helperText != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          _LabelText(
            key: const Key('label-text'),
            labelText: labelText,
            isRequired: isRequired,
          ),
          const SizedBox(height: 12.0),
        ],
        TextFormField(
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          obscuringCharacter: '*',
          maxLines: maxLines,
          readOnly: readOnly,
          onChanged: onChanged,
          onTap: onTap,
          enabled: enabled,
          autocorrect: autocorrect,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: hintTextStyle,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 12.0,
                ),
          ),
        ),
        if (_showHintText) ...[
          const SizedBox(height: 4.0),
          _HelperText(
            key: const Key('helper-text'),
            helperText: helperText!,
          ),
        ],
        // if (_showErrorText) ...[
        //   const SizedBox(height: 4.0),
        //   _ErrorText(
        //     key: const Key('error-text'),
        //     errorText: errorText!,
        //     style: errorStyle,
        //   ),
        // ],
      ],
    );
  }
}

// class _ErrorText extends StatelessWidget {
//   const _ErrorText({super.key, required this.errorText, this.style});

//   final String errorText;
//   final TextStyle? style;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       errorText,
//       style: style ?? context.twelve400,
//     );
//   }
// }

class _HelperText extends StatelessWidget {
  const _HelperText({
    super.key,
    required this.helperText,
  });

  final String helperText;

  @override
  Widget build(BuildContext context) {
    return Text(
      helperText,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}

class _LabelText extends StatelessWidget {
  const _LabelText({
    super.key,
    required this.labelText,
    bool? isRequired,
  }) : isRequired = isRequired ?? false;

  final String? labelText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          labelText!,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        if (isRequired) ...[
          const SizedBox(width: 4.0),
          Text(
            '*',
            key: const Key('required-indicator'),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ],
    );
  }
}
