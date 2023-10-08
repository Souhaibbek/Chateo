import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> myAlertDialog(
  BuildContext context, {
  void Function()? onTap,
  required String text,
  String title = 'Confirm',
}) {
  var style = Theme.of(context);

  return Get.defaultDialog(
    actions: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.9),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
              child: Text(
            'Yes',
            style: style.textTheme.bodyLarge,
          )),
        ),
      ),
      GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: style.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
              child: Text(
            'No',
            style: style.textTheme.bodyLarge,
          )),
        ),
      ),
    ],
    title: title,
    titleStyle: style.textTheme.headlineMedium,
    middleText: text,
    middleTextStyle: style.textTheme.bodyMedium,
    contentPadding: EdgeInsets.all(20.h),
  );
}
