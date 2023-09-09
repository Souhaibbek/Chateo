import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onSubmit,
    required this.type,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final void Function(String)? onSubmit;
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);
    return TextFormField(
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
            const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        fillColor: Theme.of(context).primaryColorLight,
        filled: true,
        hintText: hintText,
        hintStyle: style.textTheme.bodyMedium!.copyWith(
          color: style.hintColor,
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}
