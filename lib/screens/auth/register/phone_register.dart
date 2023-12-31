import 'package:chateo/screens/auth/register/reg_controller.dart';
import 'package:chateo/utils/buttons.dart';
import 'package:chateo/widgets/global_appbar.dart';
import 'package:chateo/widgets/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneRegister extends StatelessWidget {
  const PhoneRegister({super.key});

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
          padding: EdgeInsets.fromLTRB(24.0.w, 0.0.h, 24.0.w, 16.0.h),
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
                        child: PhoneField(
                          controller: controller.phoneController,
                          onChanged: (phone) {
                            controller.getCompleteNumber(phone);
                          },
                          validator: (value) {
                            if (value == null || value.number.isEmpty) {
                              return "Phone number required";
                            }
                            return '';
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Obx(
                () => controller.loadingPhoneAuth.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    : AppButtonPrimary(
                        title: 'Continue',
                        onPressed: controller.phoneController.text.isNotEmpty
                            ? () {
                                if (controller.phoneFormKey.currentState!
                                    .validate()) {
                                  controller.phoneAuth(
                                    phoneNumber:
                                        controller.completeNumber.value,
                                  );
                                }
                              }
                            : null,
                      ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
