import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool autofocus;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final InputDecoration? decoration;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.helperText,
    this.errorText,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.decoration,
    this.labelStyle,
    this.textStyle,
    this.borderColor,
    this.borderRadius = 8.0,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: decoration ??
          InputDecoration(
            labelText: labelText,
            hintText: hintText,
            helperText: helperText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderColor ?? Colors.blue,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            labelStyle: labelStyle ?? const TextStyle(color: Colors.grey),
            hintStyle: const TextStyle(color: Colors.grey),
            errorStyle: const TextStyle(color: Colors.red),
          ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autofocus: autofocus,
      focusNode: focusNode,
      onChanged: onChanged,
      style: textStyle ?? const TextStyle(color: Colors.black),
    );
  }
}