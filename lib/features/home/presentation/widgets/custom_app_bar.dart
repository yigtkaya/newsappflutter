part of '../home_view.dart';

final class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kWhite,
      surfaceTintColor: AppColors.kWhite,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: AppDesignConstants.spacingMedium,
          ),
          child: Row(
            spacing: AppDesignConstants.spacingSmall,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kGreyLight1,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(LucideIcons.search),
                  onPressed: () {},
                ),
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.kGreyLight1,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(LucideIcons.bell),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(72.h);
}
