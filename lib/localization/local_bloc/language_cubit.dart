import 'package:flutter/material.dart';
import 'package:newsappflutter/core/cubit/base_cubit.dart';
import 'package:newsappflutter/localization/languages/english.dart';
import 'package:newsappflutter/localization/languages/turkish.dart';
import 'package:newsappflutter/localization/models/language.dart';

part 'language_state.dart';

/// Language cubit class.
final class LanguageCubit extends BaseCubit<LanguageState> {
  /// Constructor for LanguageCubit.
  LanguageCubit() : super(const LanguageState()) {
    loadInitialLanguage();
  }

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
