import 'package:flutter/material.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';

@immutable

/// App theme class.
final class AppTheme {
  const AppTheme._();

  // Font family constant
  static const String _fontFamily = 'YourFontFamily'; // Replace with your font

  // Colors for light theme
  static const Color _backgroundColorLight = Color(0xFFFFFFFF);
  static const Color _surfaceColorLight = Color(0xFFF5F5F5);
  static const Color _textColorLight = Color(0xFF000000);

  // Colors for dark theme
  static const Color _backgroundColorDark = Color(0xFF121212);
  static const Color _surfaceColorDark = Color(0xFF1E1E1E);
  static const Color _textColorDark = Color(0xFFFFFFFF);

  // Text styles base definitions
  static TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: _fontFamily,
    );
  }

  // Light theme text styles
  static final TextStyle _titleLargeLight = _getTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: _textColorLight,
  );

  static final TextStyle _titleMediumLight = _getTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: _textColorLight,
  );

  static final TextStyle _titleSmallLight = _getTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: _textColorLight,
  );

  static final TextStyle _bodyLargeLight = _getTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: _textColorLight,
  );

  static final TextStyle _bodyMediumLight = _getTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: _textColorLight,
  );

  static final TextStyle _bodySmallLight = _getTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: _textColorLight,
  );

  // Dark theme text styles
  static final TextStyle _titleLargeDark = _getTextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: _textColorDark,
  );

  static final TextStyle _titleMediumDark = _getTextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: _textColorDark,
  );

  static final TextStyle _titleSmallDark = _getTextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: _textColorDark,
  );

  static final TextStyle _bodyLargeDark = _getTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: _textColorDark,
  );

  static final TextStyle _bodyMediumDark = _getTextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: _textColorDark,
  );

  static final TextStyle _bodySmallDark = _getTextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: _textColorDark,
  );

  /// Get the error style.
  static TextStyle getErrorStyle({Color? color}) => _getTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? const Color(0xFFFF0000),
      );

  /// Get the light theme.
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.kPrimary100,
        surface: _surfaceColorLight,
        onPrimary: _textColorLight,
      ),
      scaffoldBackgroundColor: _backgroundColorLight,
      cardTheme: CardTheme(
        color: _surfaceColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusMedium,
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: _titleLargeLight,
        titleMedium: _titleMediumLight,
        titleSmall: _titleSmallLight,
        bodyLarge: _bodyLargeLight,
        bodyMedium: _bodyMediumLight,
        bodySmall: _bodySmallLight,
      ),
    );
  }

  /// Get the dark theme.
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.kPrimary100,
        surface: _surfaceColorDark,
        onPrimary: _textColorDark,
      ),
      scaffoldBackgroundColor: _backgroundColorDark,
      cardTheme: CardTheme(
        color: _surfaceColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusMedium,
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: _titleLargeDark,
        titleMedium: _titleMediumDark,
        titleSmall: _titleSmallDark,
        bodyLarge: _bodyLargeDark,
        bodyMedium: _bodyMediumDark,
        bodySmall: _bodySmallDark,
      ),
    );
  }
}
