part of '../../main.dart';

/// App widget.
final class App extends StatelessWidget {
  /// Constructor for App.
  App({super.key});

  /// App router.
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: AppDesignConstants.designSize,
          minTextAdapt: true,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            routerConfig: _appRouter.config(
              navigatorObservers: () => [
                CustomRouteObserver(),
              ],
            ),
            locale: state.selectedLanguage.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.lightTheme,
          ),
        );
      },
    );
  }
}
