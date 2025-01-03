import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/extensions/language_extension.dart';

final class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: LucideIcons.house,
            label: context.l10n.home,
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavBarItem(
            icon: LucideIcons.bookmark,
            label: context.l10n.bookmarks,
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
        ],
      ),
    );
  }
}

final class _NavBarItem extends StatelessWidget {
  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDesignConstants.spacingSmall,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                horizontal: AppDesignConstants.spacingMedium,
                vertical: AppDesignConstants.spacingSmall,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.kBlack : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  AppDesignConstants.borderRadiusLarge,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: isSelected ? AppColors.kWhite : AppColors.kGrey,
                    size: 24.r,
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    child: SizedBox(
                      width: isSelected ? 10.w : 0,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 350),
                    child: isSelected
                        ? Text(
                            label,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.kWhite,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const SizedBox.shrink(),
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
