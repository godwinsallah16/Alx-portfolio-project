import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:eventify/core/utils/pref_utils.dart';
import 'package:eventify/core/utils/size_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.redA40066,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF20B9FC),
    secondaryContainer: Color(0X0CFD6B22),

    // On colors(text colors)
    onPrimary: Color(0XCC1B1F31),
    onPrimaryContainer: Color(0XFFD6D6D6),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // DeepOrange
  Color get deepOrange50 => Color(0XFFF9ECE9);

  // DeepPurple
  Color get deepPurpleA400 => Color(0XFF5835FB);

  // Gray
  Color get gray50 => Color(0XFFF9F9F9);
  Color get gray5001 => Color(0XFFF9FAFF);
  Color get gray5002 => Color(0XFFF4FBF8);
  Color get gray5003 => Color(0XFFF7F5FF);

  // RedAc
  Color get redA4000c => Color(0X0CFD2222);

  // Red
  Color get redA40066 => Color(0X66FD2121);

  // Teal
  Color get teal400 => Color(0XFF22B07D);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
