part of '../login_view.dart';

/// Login mixin.
mixin _LoginMixin on State<_LoginForm> {
  /// Form key.
  final _formKey = GlobalKey<FormState>();

  /// Email controller.
  final _emailController = TextEditingController();

  /// Password controller.
  final _passwordController = TextEditingController();

  /// Handle login pressed.
  Future<void> _handleLoginPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      await context
          .read<AuthCubit>()
          .signInWithEmailAndPassword(
            _emailController.text,
            _passwordController.text,
          )
          .makeWithLoadingDialog(context: context);
    }
  }

  /// Handle forgot password pressed.
  Future<void> _handleForgotPasswordPressed() async {
    await context.router.push(const ForgotPasswordRoute());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
