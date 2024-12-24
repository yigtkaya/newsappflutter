import 'package:flutter/material.dart';

/// Extension on [BuildContext] to get the [MediaQueryData], [ThemeData]
/// , [TextTheme], and some padding values.
extension ContextExtension on BuildContext {
  /// Get the [MediaQueryData] of the context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get the screen height of the context.
  double get screenHeight => mediaQuery.size.height;

  /// Get the screen width of the context.
  double get screenWidth => mediaQuery.size.width;

  /// Get the theme of the context.
  ThemeData get theme => Theme.of(this);

  /// Get the text theme of the context.
  TextTheme get textTheme => theme.textTheme;
}
