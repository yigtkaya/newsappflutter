part of '../onboarding_view.dart';

final class _OnboardingButton extends StatelessWidget {
  const _OnboardingButton({
    required ValueNotifier<int> currentPageNotifier,
    required List<_Onboard> onboardingContents,
    required PageController pageController,
  })  : _currentPageNotifier = currentPageNotifier,
        _onboardingContents = onboardingContents,
        _pageController = pageController;

  final ValueNotifier<int> _currentPageNotifier;
  final List<_Onboard> _onboardingContents;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPageNotifier,
      builder: (context, currentPage, _) => SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(
            AppDesignConstants.borderRadiusSmall,
          ),
          color: AppColors.kBlack,
          child: Text(
            _currentPageNotifier.value == _onboardingContents.length - 1 ? context.l10n.getStarted : context.l10n.next,
            style: context.textTheme.bodyLarge!.copyWith(
              color: AppColors.kWhite,
            ),
          ),
          onPressed: () {
            if (_currentPageNotifier.value < _onboardingContents.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ),
    );
  }
}
