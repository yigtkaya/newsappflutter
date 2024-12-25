import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/constants/asset_constants.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/extensions/future_extension.dart';
import 'package:newsappflutter/core/extensions/language_extension.dart';
import 'package:newsappflutter/core/router/app_router.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';
import 'package:newsappflutter/features/auth/presentation/sign_up_view.dart';
import 'package:newsappflutter/product/widgets/icons/asset_icon.dart';
import 'package:newsappflutter/product/widgets/text_areas/email_area.dart';
import 'package:newsappflutter/product/widgets/text_areas/password_area.dart';
import 'package:newsappflutter/product/widgets/toast/custom_toast.dart';

part 'widgets/footer_text.dart';
part 'widgets/or_row.dart';
part 'widgets/social_button.dart';
part 'widgets/auth_button.dart';
part 'mixins/login_mixin.dart';
part 'widgets/login_form.dart';

@RoutePage()

/// Login view.
class LoginView extends StatefulWidget {
  /// Constructor for LoginView.
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignConstants.spacingMedium,
            vertical: AppDesignConstants.spacingLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppDesignConstants.spacingMedium,
            children: [
              HeaderTexts(
                title: context.l10n.signIn,
                description: context.l10n.signInDescription,
              ),
              const SizedBox(
                height: AppDesignConstants.spacingLarge,
              ),
              const _LoginForm(),
              const Spacer(),
              FooterText(
                text: context.l10n.dontHaveAnAccount,
                onTapText: context.l10n.signUp,
                onTap: () => context.router.push(const SignUpRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
