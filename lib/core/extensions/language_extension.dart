import 'package:flutter/material.dart';
import 'package:newsappflutter/core/router/app_router.dart';
import 'package:newsappflutter/localization/app_localizations.dart';

/// Extension for BuildContext to get AppLocalizations.
extension AppLocalizationsX on BuildContext {
  /// Get AppLocalizations.
  AppLocalizations get l10n => AppLocalizations.of(this);
}

// Global accessor for localizations
AppLocalizations get tr {
  final context = rootNavigatorKey.currentContext;
  assert(
    context != null,
    'No context found. Make sure you have initialized your app properly.',
  );
  return AppLocalizations.of(context!);
}
