import 'package:chateo/screens/auth/register/register_controller.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    var style = Theme.of(context);

    return Scaffold(
      appBar: GlobalAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder(
        init: RegisterController(),
        initState: (_) {},
        builder: (controller) => Padding(
          padding: EdgeInsets.fromLTRB(24.0.w, 40.0.h, 24.0.w, 16.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter Your Phone Number',
                        style: style.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Please confirm your country code and enter your phone number',
                        style: style.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Form(
                        key: controller.phoneFormKey,
                        child: IntlPhoneField(
                          controller: controller.phoneController,
                          showDropdownIcon: false,
                          cursorColor: style.primaryColor,
                          keyboardAppearance: Theme.of(context).brightness,
                          keyboardType: TextInputType.phone,
                          flagsButtonMargin:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          pickerDialogStyle: PickerDialogStyle(
                            searchFieldInputDecoration: InputDecoration(
                              hintText: 'Search country',
                              counterText: '',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
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
                            contentPadding: const EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
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
                          onChanged: (phone) {
                            controller.completeNumber.value =
                                phone.completeNumber;
                            controller.update();
                          },
                          validator: (value) {
                            if (value == null || value.number.isEmpty) {
                              return "Phone number required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              AppButtonPrimary(
                title: 'Continue',
                onPressed: controller.phoneController.value.text.isNotEmpty
                    ? () {
                        if (controller.phoneFormKey.currentState!.validate()) {
                          controller.phoneAuth(
                            phoneNumber: controller.completeNumber.value,
                          );
                        }
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
