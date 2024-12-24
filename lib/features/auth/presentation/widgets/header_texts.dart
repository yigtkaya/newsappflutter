part of '../sign_up_view.dart';

/// Header texts.
final class HeaderTexts extends StatelessWidget {
  /// Constructor.
  const HeaderTexts({
    required this.title,
    required this.description,
    super.key,
  });

  /// Title.
  final String title;

  /// Description.
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppDesignConstants.spacingSmall,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kGrey,
          ),
        ),
      ],
    );
  }
}
