part of '../login_view.dart';

/// Footer text widget.
final class FooterText extends StatelessWidget {
  /// Constructor for FooterText.
  const FooterText({
    required this.text,
    required this.onTapText,
    required this.onTap,
    super.key,
  });

  /// Text to display.
  final String text;

  /// Text to display when tapped.
  final String onTapText;

  /// Callback to handle tap event.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kGrey,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            onTapText,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
