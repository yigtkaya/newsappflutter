import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/core/constants/asset_constants.dart';
import 'package:newsappflutter/core/router/app_router.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';

@RoutePage()

/// Splash view.
final class SplashView extends StatelessWidget {
  /// Constructor for SplashView.
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Future.delayed(
            const Duration(seconds: 2),
            () {
              context.router.replace(
                const HomeRoute(),
              );
            },
          );
        } else if (state is AuthLoading) {
          return;
        } else {
          context.router.replace(
            const LoginRoute(),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            AssetConstants.images.newsLogo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
