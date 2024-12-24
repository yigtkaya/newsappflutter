part of 'language_cubit.dart';

@immutable

/// Language state class.
final class LanguageState extends Equatable {
  /// Constructor for LanguageState.
  const LanguageState({
    Language? selectedLanguage,
  }) : selectedLanguage = selectedLanguage ?? turkish;

  /// Selected language.
  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];

  /// Copy with method for LanguageState.
  LanguageState copyWith({Language? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
