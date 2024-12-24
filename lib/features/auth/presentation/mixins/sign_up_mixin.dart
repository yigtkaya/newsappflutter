part of '../sign_up_view.dart';

/// Sign up mixin.
mixin _SignUpFormMixin on State<_SignUpForm> {
  /// Form key.
  final _formKey = GlobalKey<FormState>();

  /// Email controller.
  final _emailController = TextEditingController();

  /// Password controller.
  final _passwordController = TextEditingController();

  /// name password controller.
  final _nameController = TextEditingController();

  /// Handle sign up pressed.
  Future<void> _handleSignUpPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      await context
          .read<AuthCubit>()
          .signUpWithEmailAndPassword(
            _emailController.text,
            _passwordController.text,
            _nameController.text,
          )
          .makeWithLoadingDialog(context: context);
    }
  }

  /// Name validator.
  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return context.l10n.pleaseEnterName;
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
