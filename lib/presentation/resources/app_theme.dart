import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color gradient1 = Color(0xFF2147E6);
  static const Color blueMain = Color(0xFF2147E6);
  static const Color blueMainDark = Color(0xFF2948AA);
  static const Color grey500 = Color(0xFF81898B);
  static const Color grey300 = Color(0xFFD0D5D8);
  static const Color powder = Color(0xFFFFFDFF);
  static const Color almostBlack = Color(0xFF131C43);
  static const Color label300 = Color(0xFF555B77);
  static const Color label600 = Color(0xFF363C57);
  static const Color green = Color(0xFF9CDF92);
  // static const Color bgMain = Color(0xFF272B3F);
  static const Color bgMain = Color(0xFF232F34);
  static const Color red = Color(0xFFE95656);
  static const Color blue = Color(0xFF0052FF);
  static const Color linear1 = Color(0xFF5B76EA);
  static const Color linear2 = Color(0xFF2948AA);
  static const Color primaryc = Color(0xFF344955);
  static const Color secondaryc = Color(0xFF232F34);
  static const Color tertiaryc = Color(0xFF4A6572);
  static ThemeData get() {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: BorderSide(color: Colors.white, width: 0.4.w));
    return ThemeData(
      // scaffoldBackgroundColor: const Color(0xFF272B3F),
      scaffoldBackgroundColor: secondaryc,
      primaryColor: primaryc,
      buttonTheme: ButtonThemeData(
        minWidth: 230.w,
        height: 40.h,
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      cardTheme: CardTheme(
        shape: border.copyWith(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.04)),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: border,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Colors.blue, width: 0.4.w)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(color: Colors.red, width: 0.4.w)),
        disabledBorder: border,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.white,
        ),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.sp),
        toolbarTextStyle: TextTheme(
                headline6: TextStyle(color: Colors.white, fontSize: 20.sp))
            .bodyText2,
      ),
    );
  }

  static final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: primaryColor,
  );

  static const primaryColor = Color(0xFF272B3F);
}
