part of '../login_view.dart';

/// Auth button widget.
final class AuthButton extends StatelessWidget {
  /// Constructor for AuthButton.
  const AuthButton({
    required this.text,
    required this.onPressed,
    this.listen = false,
    super.key,
  });

  /// Text to display.
  final String text;

  /// Callback to handle tap event.
  final VoidCallback onPressed;

  /// Listen to auth state.
  final bool listen;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => listen,
      listener: (context, state) {
        if (state is AuthFailure) {
          CustomToastMessage.showCustomToast(
            context,
            state.failure.message,
            AppColors.kDanger400,
          );
          Navigator.pop(context);
        }

        if (state is AuthSuccess) {
          Navigator.pop(context);

          context.router.replace(
            const RootRoute(),
          );
        }

        if (state is ForgotPasswordSuccess) {
          Navigator.pop(context);

          CustomToastMessage.showCustomToast(
            context,
            context.l10n.forgotPasswordSuccess,
            AppColors.kSuccess400,
          );
        }
      },
      child: CupertinoButton(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: AppDesignConstants.spacingMedium,
        ),
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadiusSmall,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: context.textTheme.bodyLarge!.copyWith(
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}
