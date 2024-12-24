import 'dart:async';
import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_constants.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/di/deoendecy_injection_items.dart';
import 'package:newsappflutter/core/di/dependecy_injection.dart';
import 'package:newsappflutter/core/observers/custom_route_observer.dart';
import 'package:newsappflutter/core/router/app_router.dart';
import 'package:newsappflutter/core/theme/app_theme.dart';
import 'package:newsappflutter/features/app/firebase_options.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';
import 'package:newsappflutter/localization/app_localizations.dart';
import 'package:newsappflutter/localization/cubit/language_cubit.dart';

part 'features/app/setup.dart';
part 'features/app/initializer.dart';
part 'features/app/app.dart';

void main() {
  setup(
    () => _Initializer(
      child: App(),
    ),
  );
}
