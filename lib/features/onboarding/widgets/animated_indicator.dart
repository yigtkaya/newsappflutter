part of '../onboarding_view.dart';

final class _AnimatedDotIndicator extends StatelessWidget {
  const _AnimatedDotIndicator({
    required this.length,
    required this.currentIndex,
    required this.dotColor,
    required this.activeDotColor,
  });
  final int length;
  final int currentIndex;
  final Color dotColor;
  final Color activeDotColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < length; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: i == currentIndex ? 20.sp : 10.sp,
            margin: EdgeInsets.symmetric(horizontal: 4.sp),
            height: 10.sp,
            decoration: BoxDecoration(
              color: i == currentIndex ? activeDotColor : dotColor,
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadiusSmall,
              ),
            ),
          ),
      ],
    );
  }
}
