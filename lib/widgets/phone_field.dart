import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
  });
  final TextEditingController? controller;
  final Function(PhoneNumber)? onChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context);

    return IntlPhoneField(
      controller: controller,
      showDropdownIcon: false,
      autovalidateMode: AutovalidateMode.always,
      cursorColor: style.primaryColor,
      keyboardAppearance: Theme.of(context).brightness,
      keyboardType: TextInputType.phone,
      flagsButtonMargin: const EdgeInsets.symmetric(horizontal: 4.0),
      pickerDialogStyle: PickerDialogStyle(
        searchFieldInputDecoration: InputDecoration(
          hintText: 'Search country',
          counterText: '',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintStyle: style.textTheme.bodyMedium!.copyWith(
            color: style.hintColor,
          ),
          prefixIcon: const Icon(Icons.search),
          alignLabelWithHint: true,
        ),
      ),
      decoration: InputDecoration(
        counterText: '',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding:
            const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
        fillColor: Theme.of(context).primaryColorLight,
        filled: true,
        hintText: 'Phone Number',
        hintStyle: style.textTheme.bodyMedium!.copyWith(
          color: style.hintColor,
        ),
        alignLabelWithHint: true,
      ),
      initialCountryCode: 'TN',
      onSubmitted: (p0) {},
      onChanged: onChanged,
      validator: validator,
    );
  }
}
