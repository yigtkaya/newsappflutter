part of '../home_view.dart';

final class BreakingNewsCard extends StatelessWidget {
  const BreakingNewsCard({
    required this.article,
    required this.onTap,
    super.key,
  });

  final Article article;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadiusMedium,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
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
    return CachedNetworkImage(
      imageUrl: article.imageUrl ?? '',
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.kGrey,
        highlightColor: AppColors.kGreyLight1,
        child: Container(color: AppColors.kWhite),
      ),
      errorWidget: (context, url, error) => Center(
        child: Icon(LucideIcons.image_off, color: AppColors.kGrey),
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
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
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
      children: [
        Text(
          article.source,
          style: context.textTheme.bodySmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 4.w),
        Icon(
          LucideIcons.badge_check,
          color: Colors.blue,
          size: 16.w,
        ),
        SizedBox(width: 8.w),
        Text(
          DateTime.parse(article.publishedAt.toIso8601String()).toString(),
          style: context.textTheme.bodySmall?.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _BuildTitle extends StatelessWidget {
  const _BuildTitle({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Text(
      article.title,
      style: context.textTheme.titleMedium?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
