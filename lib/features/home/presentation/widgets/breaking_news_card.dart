part of '../home_view.dart';

final class BreakingNewsCard extends StatelessWidget {
  const BreakingNewsCard({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusMedium,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => context.router.push(
            NewsDetailRoute(article: article),
          ),
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusMedium,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _BuildImage(
                article: article,
              ),
              const _BuildGradientOverlay(),
              _BuildContent(
                article: article,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _BuildImage extends StatelessWidget {
  const _BuildImage({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'article_image_${article.title}',
      child: CachedNetworkImage(
        imageUrl: article.urlToImage ?? '',
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: AppColors.kGrey,
          highlightColor: AppColors.kGreyLight1,
          child: Container(
            color: AppColors.kWhite,
            height: double.infinity,
          ),
        ),
        errorWidget: (context, url, error) => SizedBox(
          height: double.infinity,
          child: Center(
            child: Icon(LucideIcons.image_off, color: AppColors.kGrey),
          ),
        ),
      ),
    );
  }
}

final class _BuildGradientOverlay extends StatelessWidget {
  const _BuildGradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withAlpha(80),
          ],
        ),
      ),
    );
  }
}

final class _BuildContent extends StatelessWidget {
  const _BuildContent({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppDesignConstants.spacingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BuildCategory(article: article),
          const Spacer(),
          _BuildSourceAndTime(article: article),
          SizedBox(height: 8.h),
          _BuildTitle(article: article),
        ],
      ),
    );
  }
}

final class _BuildCategory extends StatelessWidget {
  const _BuildCategory({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesignConstants.spacingSmall,
        vertical: AppDesignConstants.spacingSmall,
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
    );
  }
}

final class _BuildSourceAndTime extends StatelessWidget {
  const _BuildSourceAndTime({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: AppDesignConstants.spacingSmall,
          children: [
            Text(
              article.source?.name ?? '',
              style: context.textTheme.bodySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Icon(
              LucideIcons.badge_check,
              color: AppColors.kDarkBlue,
              size: 16.w,
            ),
            Text(
              DateTime.parse(
                article.publishedAt!.toIso8601String(),
              ).formatForTripItem(),
              style: context.textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}

final class _BuildTitle extends StatelessWidget {
  const _BuildTitle({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Text(
      article.title.toString(),
      style: context.textTheme.bodyLarge?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
