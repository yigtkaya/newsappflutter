part of '../login_view.dart';

/// Login form.
final class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> with _LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDesignConstants.spacingMedium,
        children: [
          EmailArea(
            controller: _emailController,
            onChanged: () {},
          ),
          PasswordArea(
            controller: _passwordController,
            onChanged: () {},
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: _handleForgotPasswordPressed,
              child: Text(
                context.l10n.forgotPassword,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.kGrey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppDesignConstants.spacingLarge,
          ),
          SizedBox(
            width: double.infinity,
            child: AuthButton(
              text: context.l10n.signIn,
              onPressed: _handleLoginPressed,
              listen: true,
            ),
          ),
          const OrRow(),
          SocialButton(
            text: context.l10n.signInWithGoogle,
            iconPath: AssetConstants.icons.google,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
