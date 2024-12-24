part of '../../../main.dart';

/// Setup the app.
Future<void> setup(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await firebaseConfig();

    // AppEnvironment.setup(configuration: DevEnv());

    // setup dependency injection
    DependencyInjection.setup();

    // singular injection at the start of the app
    await DepInItems.productCache.init();

    runApp(
      await builder(),
    );
  }, (error, stack) {
    log(
      error.toString(),
      stackTrace: stack,
      name: AppConstants.initFunctionName,
    );
    FirebaseCrashlytics.instance.recordError(
      error,
      stack,
    );
  });
}

/// Configure the firebase services
Future<void> firebaseConfig() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  await FirebaseAnalytics.instance.logAppOpen();
}
