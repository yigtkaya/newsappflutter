import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/localization/app_localizations.dart';
import 'package:newsappflutter/localization/languages/english.dart';
import 'package:newsappflutter/localization/languages/turkish.dart';
import 'package:newsappflutter/localization/models/language.dart';

part 'language_state.dart';

/// Extension for BuildContext to get AppLocalizations.
extension AppLocalizationsX on BuildContext {
  /// Get AppLocalizations.
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Language cubit class.
final class LanguageCubit extends Cubit<LanguageState> {
  /// Constructor for LanguageCubit.
  LanguageCubit() : super(const LanguageState());

  /// Supported languages.
  final supportedLanguages = [
    turkish,
    english,
  ];

  /// Change language method.
  void changeLanguage(Language selectedLanguage) {
    emit(state.copyWith(selectedLanguage: selectedLanguage));
  }

  /// Load initial language method from the shared preferences
  ///  or default to device locale.
  void loadInitialLanguage() {
    emit(state.copyWith(selectedLanguage: turkish));
  }
}
