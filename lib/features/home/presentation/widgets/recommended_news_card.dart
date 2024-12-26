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
        padding: const EdgeInsets.all(AppDesignConstants.spacingMedium),
        child: Row(
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
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDesignConstants.spacingSmall,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kDarkBlue,
                      borderRadius: BorderRadius.circular(
                        AppDesignConstants.borderRadiusLarge,
                      ),
                    ),
                    child: Text(
                      'Sports',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    article.title,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        article.source,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.kGrey,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        LucideIcons.badge_check,
                        color: Colors.blue,
                        size: 16.w,
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
