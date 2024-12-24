part of '../../main.dart';

final class _Initializer extends StatelessWidget {
  const _Initializer({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => DepInItems.languageCubit,
        ),
        BlocProvider<AuthCubit>(
          create: (context) => DepInItems.authCubit,
        ),
      ],
      child: child,
    );
  }
}
