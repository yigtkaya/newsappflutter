import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/extensions/language_extension.dart';

part 'widgets/onboarding_content.dart';
part 'widgets/animated_indicator.dart';
part 'widgets/onboarding_button.dart';

/// Onboarding view for the app
@RoutePage()
class OnboardingView extends StatefulWidget {
  /// Constructor for the OnboardingView
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController = PageController();

  // Use a ValueNotifier to track the current page
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  final List<_Onboard> _onboardingContents = [
    const _Onboard(
      imagePath: 'assets/images/onboarding/onboarding_1.png',
      title: 'Welcome',
      description: 'Discover the latest news',
    ),
    const _Onboard(
      imagePath: 'assets/images/onboarding/onboarding_2.png',
      title: 'Stay Informed',
      description: 'Get real-time updates',
    ),
    const _Onboard(
      imagePath: 'assets/images/onboarding/onboarding_3.png',
      title: 'Personalized News',
      description: 'Customize your news feed',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _currentPageNotifier.value = _pageController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          AppDesignConstants.spacingLarge,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingContents.length,
                itemBuilder: (context, index) => _OnboardingContent(
                  imagePath: _onboardingContents[index].imagePath,
                  title: _onboardingContents[index].title,
                  description: _onboardingContents[index].description,
                ),
              ),
            ),
            ValueListenableBuilder<int>(
              valueListenable: _currentPageNotifier,
              builder: (context, currentPage, _) => _AnimatedDotIndicator(
                length: _onboardingContents.length,
                currentIndex: currentPage,
                dotColor: AppColors.kGrey.withAlpha(100),
                activeDotColor: AppColors.kBlack,
              ),
            ),
            const SizedBox(
              height: AppDesignConstants.spacingLarge,
            ),
            _OnboardingButton(
              currentPageNotifier: _currentPageNotifier,
              onboardingContents: _onboardingContents,
              pageController: _pageController,
            ),
          ],
        ),
      ),
    );
  }
}

final class _Onboard {
  const _Onboard({
    required this.imagePath,
    required this.title,
    required this.description,
  });
  final String imagePath;
  final String title;
  final String description;
}
