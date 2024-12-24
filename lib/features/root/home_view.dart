import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/core/extensions/future_extension.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';

@RoutePage()

/// Home view.
final class HomeView extends StatelessWidget {
  /// Constructor for HomeView.
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<AuthCubit>().signOut().makeWithLoadingDialog(
                  context: context,
                );
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
