part of '../onboarding_view.dart';

final class _OnboardingContent extends StatelessWidget {
  const _OnboardingContent({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          imagePath,
          height: 250.h,
        ),
        const Spacer(),
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(
          height: AppDesignConstants.spacingMedium,
        ),
        Text(
          description,
          style: context.textTheme.bodyMedium,
        ),
        const Spacer(),
      ],
    );
  }
}
