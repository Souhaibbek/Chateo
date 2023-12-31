// ignore_for_file: slash_for_doc_comments

import 'package:chateo/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    // main colors
    scaffoldBackgroundColor: AppColors.kWhitePure,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    expansionTileTheme: const ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
    ),
    // colorScheme: const ColorScheme.light(),
    primaryColor: AppColors.kPrimaryColor,
    primaryColorLight: AppColors.kWhiteColor,
    primaryColorDark: AppColors.kDarkColor,
    cardColor: AppColors.kPrimaryColor,
    disabledColor: AppColors.kGreyColor,
    splashColor: Colors.transparent,
    secondaryHeaderColor: AppColors.kPrimaryColor,
    hintColor: AppColors.kGreyColor,
    iconTheme: const IconThemeData(size: 24, color: AppColors.kBlackColor),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.kPrimaryColor),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: Colors.black, size: 28),
    ),
    cardTheme: const CardTheme(
        color: Colors.black, shadowColor: Colors.grey, elevation: 4),
    canvasColor: AppColors.kWhitePure,
    // app bar theme
    appBarTheme: const AppBarTheme(
      shadowColor: AppColors.kWhitePure,
      foregroundColor: AppColors.kWhitePure,
      surfaceTintColor: AppColors.kWhitePure,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.kWhitePure,
      iconTheme: IconThemeData(
        color: AppColors.kBlackColor,
        size: 18,
      ),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.kWhitePure,
      ),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: AppColors.kGreyColor,
      buttonColor: AppColors.kPrimaryColor,
      splashColor: AppColors.kPrimaryColor,
      highlightColor: AppColors.kPrimaryColor,
      focusColor: AppColors.kPrimaryColor,
      hoverColor: AppColors.kPrimaryColor,
    ),

    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
      headlineLarge: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.kPrimaryColor,
        fontFamily: 'Mulish',
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kGreyColor,
        fontFamily: 'Mulish',
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
      headlineMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kBlackColor,
        fontFamily: 'Mulish',
      ),
    ),
  );
/**
 * 
 * 
 * 











































 
 */
  static ThemeData darkTheme = ThemeData(
    // main colors
    scaffoldBackgroundColor: AppColors.kBlackColor,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    useMaterial3: true,
    brightness: Brightness.dark,
    expansionTileTheme: const ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
    ),
    // colorScheme: const ColorScheme.light(),
    primaryColor: AppColors.kPrimaryColorDark,
    primaryColorLight: AppColors.kDarkColor,
    primaryColorDark: AppColors.kWhiteColor,
    disabledColor: AppColors.kDarkColor,
    splashColor: Colors.transparent,
    secondaryHeaderColor: AppColors.kWhiteColor,
    hintColor: AppColors.kGreyColor,
    cardColor: AppColors.kBlackColor,
    canvasColor: AppColors.kBlackColor,

    iconTheme: const IconThemeData(size: 24, color: AppColors.kWhitePure),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.kPrimaryColorDark),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.kWhiteColor,
      selectedIconTheme: IconThemeData(color: AppColors.kDarkColor, size: 28),
    ),
    cardTheme: const CardTheme(
        color: AppColors.kWhiteColor,
        shadowColor: AppColors.kDarkColor,
        elevation: 4),

    // app bar theme
    appBarTheme: const AppBarTheme(
      shadowColor: AppColors.kBlackColor,
      foregroundColor: AppColors.kBlackColor,
      surfaceTintColor: AppColors.kBlackColor,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.kBlackColor,

      iconTheme: IconThemeData(
        color: AppColors.kWhitePure,
        size: 18,
      ),
      // shadowColor: Colors.lightPrimary,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.kBlackColor,
      ),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: AppColors.kDarkColor,
      buttonColor: AppColors.kPrimaryColorDark,
      splashColor: AppColors.kPrimaryColorDark,
      highlightColor: AppColors.kPrimaryColorDark,
      focusColor: AppColors.kPrimaryColorDark,
      hoverColor: AppColors.kPrimaryColorDark,
    ),

    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.kWhiteColor,
        fontFamily: 'Mulish',
      ),
      headlineLarge: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.kPrimaryColorDark,
        fontFamily: 'Mulish',
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.kWhiteColor,
        fontFamily: 'Mulish',
      ),
      titleMedium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kWhiteColor,
        fontFamily: 'Mulish',
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kWhiteColor,
        fontFamily: 'Mulish',
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.kWhitePure,
        fontFamily: 'Mulish',
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kWhiteColor,
        fontFamily: 'Mulish',
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.kWhiteColor,
        fontFamily: 'Mulish',
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kGreyColor,
        fontFamily: 'Mulish',
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kWhiteColor,
        fontFamily: 'Mulish',
      ),
      headlineMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.kWhiteColor,
        fontFamily: 'Mulish',
      ),
    ),
  );
}
