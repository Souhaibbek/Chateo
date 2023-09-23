import 'package:chateo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonPrimary extends StatelessWidget {
  const AppButtonPrimary({
    super.key,
    this.onPressed,
    required this.title,
    this.color,
    this.radius = 30.0,
    this.height,
    this.style,
    this.titleColor,
  });

  final void Function()? onPressed;
  final String title;
  final Color? color;
  final double radius;
  final double? height;
  final TextStyle? style;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      disabledColor: Theme.of(context).disabledColor,
      onPressed: onPressed,
      height: height ?? 50.h,
      color: color ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: style ??
              Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: titleColor ?? AppColors.kWhiteColor,
                  ),
        ),
      ),
    );
  }
}
