import 'package:flutter/material.dart';
import 'package:newsappflutter/localization/models/currency.dart';
import 'package:newsappflutter/localization/models/language.dart';

/// Turkish language.
const Language turkish = Language(
  id: 0,
  name: 'Türkçe',
  imagePath: '🇹🇷',
  urlCode: 'tr',
  locale: Locale('tr'),
  currency: turkishCurrency,
);

/// Turkish currency.
const Currency turkishCurrency = Currency(
  code: '784',
  name: 'Turkish Lira',
  shortName: 'TL',
  symbol: '₺',
);
