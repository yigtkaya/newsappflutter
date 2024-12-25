import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/extensions/future_extension.dart';
import 'package:newsappflutter/core/extensions/language_extension.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';
import 'package:newsappflutter/features/auth/presentation/login_view.dart';
import 'package:newsappflutter/features/auth/presentation/sign_up_view.dart';
import 'package:newsappflutter/product/widgets/text_areas/email_area.dart';

/// Forgot password view.
@RoutePage()
final class ForgotPasswordView extends StatefulWidget {
  /// Constructor for ForgotPasswordView.
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        surfaceTintColor: AppColors.kWhite,
        leading: BackButton(
          onPressed: () => context.router.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignConstants.spacingMedium,
            vertical: AppDesignConstants.spacingLarge,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppDesignConstants.spacingMedium,
              children: [
                const SizedBox(
                  height: AppDesignConstants.spacingLarge * 5,
                ),
                HeaderTexts(
                  title: context.l10n.forgotPassword,
                  description: context.l10n.forgotPasswordDescription,
                ),
                const SizedBox(
                  height: AppDesignConstants.spacingLarge,
                ),
                EmailArea(
                  controller: _emailController,
                  onChanged: () {},
                ),
                const SizedBox(
                  height: AppDesignConstants.spacingLarge,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AuthButton(
                    text: context.l10n.sendLink,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context
                            .read<AuthCubit>()
                            .forgotPassword(
                              email: _emailController.text,
                            )
                            .makeWithLoadingDialog(context: context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
