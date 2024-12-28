part of '../home_view.dart';

mixin _CarouselMixin on State<_CarouselWidget> {
  late final PageController pageController;
  late final CarouselCubit carouselCubit;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.93);
    carouselCubit = DepInItems.carouselCubit;
    pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    carouselCubit.updatePage(
      pageController.page ?? 0,
    );
  }

  @override
  void dispose() {
    pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    carouselCubit.close();
    super.dispose();
  }

  // Animation calculations
  double calculateScale(double currentPage, int index) {
    final position = currentPage - index;
    return 1.0 - (position.abs() * 0.1).clamp(0.0, 0.25);
  }

  double calculateRotation(double currentPage, int index) {
    final position = currentPage - index;
    return (position * 0.03).clamp(-0.05, 0.05);
  }
}
