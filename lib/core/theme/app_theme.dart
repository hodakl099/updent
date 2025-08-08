import 'package:flutter/material.dart';
import 'package:updent/core/util/colors_ext.dart';
import 'package:updent/core/util/get_lan.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: false,
    canvasColor: ThemeData().colorScheme.lightWhite,
    cardColor: colors.cardColor,
    dialogBackgroundColor: ThemeData().colorScheme.white,
    iconTheme: ThemeData().iconTheme.copyWith(color: colors.primary),
    primarySwatch: colors.primary_app,
    primaryColor: ThemeData().colorScheme.lightWhite,
    fontFamily: _getFontFamily(),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: colors.primary_app,
    ).copyWith(secondary: colors.secondary, brightness: Brightness.light),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ThemeData().colorScheme.fontColor,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      titleSmall: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: const TextStyle(
        color: Color(0xff667085),
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ).apply(bodyColor: ThemeData().colorScheme.fontColor),
  );
  ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    canvasColor: colors.darkColor,
    cardColor: colors.darkColor2,
    dialogBackgroundColor: colors.darkColor2,
    primaryColor: colors.darkColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colors.darkIcon,
      selectionColor: colors.darkIcon,
      selectionHandleColor: colors.darkIcon,
    ),
    fontFamily: _getFontFamily(),
    //brightness: Brightness.dark,
    iconTheme: ThemeData().iconTheme.copyWith(color: colors.darkprimary),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ThemeData().colorScheme.fontColor,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: const TextStyle(
        color: Color(0xff667085),
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ).apply(bodyColor: ThemeData().colorScheme.fontColor),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: colors.dark_primary_app,
    ).copyWith(secondary: colors.darkIcon, brightness: Brightness.dark),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colors.darkprimary;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colors.darkprimary;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colors.darkprimary;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((
        Set<MaterialState> states,
      ) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colors.darkprimary;
        }
        return null;
      }),
    ),
  );
}

String _getFontFamily() {
  if (getCurrentLanguage() == 'ar') {
    return 'Cairo';
  } else {
    return 'Aileron';
  }
}
