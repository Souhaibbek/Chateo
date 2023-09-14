import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onSubmit,
    this.type = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final void Function(String)? onSubmit;
  final String? Function(String?)? validator;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);
    return TextFormField(
      validator: validator,
      onFieldSubmitted: onSubmit,
      controller: controller,
      enableSuggestions: false,
      autocorrect: false,
      style: style.textTheme.bodyMedium,
      keyboardType: type,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            const EdgeInsets.only(left: 15, bottom: 11, top: 14, right: 15),
        fillColor: style.primaryColorLight,
        filled: true,
        hintText: hintText,
        hintStyle: style.textTheme.bodyMedium!.copyWith(
          color: style.hintColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: style.hintColor,
        suffixIconColor: style.hintColor,
        alignLabelWithHint: true,
      ),
    );
  }
}
