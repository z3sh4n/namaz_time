import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_color.dart';

enum AppTheme { dark, light }

final Map<AppTheme, ThemeData> kAppThemeData = {
  AppTheme.dark: ThemeData.dark().copyWith(
    primaryColor: kDarkPrimary,
    scaffoldBackgroundColor: kDarkPlaceholderText,
    backgroundColor: kDarkPlaceholder,
    errorColor: kDarkError,
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme().copyWith(
          headline1: TextStyle(
            fontSize: 64.sp,
            color: kDarkTextColor,
          ),
          headline2: TextStyle(
            fontSize: 32.sp,
            color: kDarkTextColor,
          ),
          headline3: TextStyle(
            fontSize: 24.sp,
            color: kDarkTextColor,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 24.sp,
            color: kDarkTextColor,
          ),
          headline5: TextStyle(
            fontSize: 20.sp,
            color: kDarkTextColor,
          ),
          headline6: TextStyle(
            fontSize: 16.sp,
            color: kDarkTextColor,
          ),
          bodyText1: TextStyle(
            fontSize: 12.sp,
            color: kDarkTextColor,
          ),
          bodyText2: TextStyle(
            fontSize: 14.sp,
            color: kDarkTextColor,
          ),
          caption: TextStyle(
            fontSize: 10.sp,
            color: kDarkTextColor.withOpacity(0.7),
          )),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 56.h),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        foregroundColor: MaterialStateProperty.all(
          kDarkTextColor,
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kDarkTextColor,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(kDarkPrimary),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kDarkPrimary,
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkPlaceholderText,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: const IconThemeData(
        color: kDarkTextColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: kDarkTextColor,
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: kLightPlaceholder),
    colorScheme: const ColorScheme.dark().copyWith(
      background: kDarkPlaceholder,
      surface: kDarkPlaceholderText,
      primary: kDarkPrimary,
      secondary: kDarkAccent,
    ),
  ),
  AppTheme.light: ThemeData.light().copyWith(
    primaryColor: kLightPrimary,
    scaffoldBackgroundColor: kLightBg,
    backgroundColor: kLightPlaceholder,
    errorColor: kLightError,
    textTheme: GoogleFonts.poppinsTextTheme(
      const TextTheme().copyWith(
        headline1: TextStyle(
          fontSize: 64.sp,
          color: kLightTextColor,
        ),
        headline2: TextStyle(
          fontSize: 32.sp,
          color: kLightTextColor,
        ),
        headline3: TextStyle(
          fontSize: 24.sp,
          color: kLightTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 24.sp,
          color: kLightTextColor,
        ),
        headline5: TextStyle(
          fontSize: 20.sp,
          color: kLightTextColor,
        ),
        headline6: TextStyle(
          fontSize: 16.sp,
          color: kLightTextColor,
        ),
        bodyText1: TextStyle(
          fontSize: 12.sp,
          color: kLightTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 14.sp,
          color: kLightTextColor,
        ),
        caption: TextStyle(
          fontSize: 10.sp,
          color: kLightTextColor.withOpacity(0.7),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 56.h),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        foregroundColor: MaterialStateProperty.all(
          kDarkTextColor,
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kDarkTextColor,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(kLightPrimary),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kLightPrimary,
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: kLightBg,
      iconTheme: const IconThemeData(color: kLightTextColor),
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: kLightTextColor,
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: kDarkPlaceholder),
    colorScheme: const ColorScheme.light().copyWith(
      background: kLightPlaceholder,
      surface: kLightPlaceholderText,
      primary: kLightPrimary,
      secondary: kLightAccent,
    ),
  )
};

const Duration kAnimationDuration = Duration(milliseconds: 300);
const Curve kAnimationCurve = Curves.easeInOut;
