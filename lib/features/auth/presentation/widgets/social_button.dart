part of '../login_view.dart';

/// Social button.
final class SocialButton extends StatelessWidget {
  /// Social button constructor.
  const SocialButton({
    required this.text,
    required this.onPressed,
    required this.iconPath,
    super.key,
  });

  /// Text.
  final String text;

  /// On pressed.
  final VoidCallback onPressed;

  /// Icon path.
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: AppDesignConstants.spacingMedium,
          ),
          side: BorderSide(
            color: AppColors.kGreyLight1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDesignConstants.borderRadiusSmall,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppDesignConstants.spacingMedium,
          children: [
            AssetIcon(
              iconName: iconPath,
              width: 24.w,
              height: 24.h,
            ),
            Text(
              text,
              style: context.textTheme.bodyLarge!.copyWith(
                color: AppColors.kBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
