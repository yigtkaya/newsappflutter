part of '../login_view.dart';

/// Or row widget.
final class OrRow extends StatelessWidget {
  /// Constructor for OrRow.
  const OrRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDesignConstants.spacingMedium,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.kGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDesignConstants.spacingMedium,
            ),
            child: Text(
              context.l10n.or,
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.kGrey,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.kGrey,
            ),
          ),
        ],
      ),
    );
  }
}
