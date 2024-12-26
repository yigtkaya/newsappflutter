part of '../home_view.dart';

final class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.actionText,
    super.key,
  });
  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignConstants.spacingMedium,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.titleSmall,
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Text(
          //     actionText,
          //     style: context.textTheme.bodyMedium!.copyWith(
          //       color: AppColors.kDarkBlue,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
