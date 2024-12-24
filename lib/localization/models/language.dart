import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:newsappflutter/localization/models/currency.dart';

part 'language.mapper.dart';

@MappableClass(discriminatorKey: 'id')

/// Language model class.
class Language with LanguageMappable {
  /// Constructor for Language.
  const Language({
    required this.id,
    required this.name,
    required this.image,
    required this.urlCode,
    required this.locale,
    required this.currency,
  });

  /// Id of the language.
  final int id;

  /// Name of the language.
  final String name;

  /// Image of the language.
  final String image;

  /// Url code of the language.
  final String urlCode;

  /// Locale of the language.
  final Locale locale;

  /// Currency of the language.
  final Currency currency;
}
