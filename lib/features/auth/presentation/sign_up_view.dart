import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/constants/asset_constants.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/extensions/future_extension.dart';
import 'package:newsappflutter/core/extensions/language_extension.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';
import 'package:newsappflutter/features/auth/presentation/login_view.dart';
import 'package:newsappflutter/product/widgets/text_areas/custom_area.dart';
import 'package:newsappflutter/product/widgets/text_areas/email_area.dart';
import 'package:newsappflutter/product/widgets/text_areas/password_area.dart';

part 'mixins/sign_up_mixin.dart';
part 'widgets/sign_up_form.dart';
part 'widgets/header_texts.dart';

@RoutePage()

/// Sign up view.
class SignUpView extends StatefulWidget {
  /// Constructor for SignUpView.
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignConstants.spacingMedium,
            vertical: AppDesignConstants.spacingLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppDesignConstants.spacingMedium,
            children: [
              HeaderTexts(
                title: context.l10n.signUp,
                description: context.l10n.signUpDescription,
              ),
              const SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              const _SignUpForm(),
              const SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              FooterText(
                text: context.l10n.aldreadyHaveAnAccount,
                onTapText: context.l10n.signIn,
                onTap: context.router.back,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
