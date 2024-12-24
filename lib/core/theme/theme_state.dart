import 'package:flutter/material.dart';
import 'package:newsappflutter/core/theme/app_theme.dart';

/// Theme state enum.
enum ThemeState {
  /// Light theme.
  light,

  /// Dark theme.
  dark;

  /// Get the current theme.
  ThemeData get currentTheme => this == ThemeState.dark ? AppTheme.darkTheme : AppTheme.lightTheme;
}
