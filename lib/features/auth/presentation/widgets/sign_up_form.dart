part of '../sign_up_view.dart';

/// Sign up form.
final class _SignUpForm extends StatefulWidget {
  /// Constructor.
  const _SignUpForm();

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> with _SignUpFormMixin {
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
          CustomTextField(
            hintText: context.l10n.name,
            controller: _nameController,
            validator: _nameValidator,
          ),
          const SizedBox(
            height: AppDesignConstants.spacingLarge,
          ),
          SizedBox(
            width: double.infinity,
            child: AuthButton(
              text: context.l10n.signUp,
              onPressed: _handleSignUpPressed,
            ),
          ),
          const SizedBox(
            height: AppDesignConstants.spacingSmall,
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
