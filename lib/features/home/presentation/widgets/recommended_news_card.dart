part of '../home_view.dart';

final class RecommendedNewsCard extends StatelessWidget {
  const RecommendedNewsCard({
    required this.article,
    required this.onTap,
    super.key,
  });

  final Article article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        AppDesignConstants.borderRadiusMedium,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppDesignConstants.spacingMedium,
          right: AppDesignConstants.spacingMedium,
          bottom: AppDesignConstants.spacingMedium,
        ),
        child: Row(
          spacing: AppDesignConstants.spacingMedium,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadiusMedium,
              ),
              child: CachedNetworkImage(
                imageUrl: article.imageUrl ?? '',
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.kGrey,
                  highlightColor: AppColors.kGreyLight1,
                  child: Container(
                    color: AppColors.kWhite,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(LucideIcons.image_off, color: AppColors.kGrey),
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: AppDesignConstants.spacingSmall,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.categories.first.capitalizeFirstLetter(),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.kGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    article.title,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: 4.w,
                    children: [
                      Text(
                        article.source,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.kGrey,
                        ),
                      ),
                      Icon(
                        LucideIcons.badge_check,
                        color: AppColors.kDarkBlue,
                        size: 16.w,
                      ),
                      Text(
                        article.publishedAt.formattedDateTime(),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.kGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}